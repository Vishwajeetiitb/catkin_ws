#!/usr/bin/env python3
import numpy as np
from numpy.linalg import inv
from qpsolvers import solve_qp
import json
import math
from numpy import linalg as LA
import rospy
import numpy as np
import time
from exo_controller_manager import ExoControllerManager
from exo_callbacks import ExoCallbacks
rospy.init_node('walking')
controller_manager = ExoControllerManager()
callback_manager = ExoCallbacks()
def clip(x,a,b):
    if x<=a:
        return a
    if x>b:
        return b
    return x

def diff(l1,l2,s):
    lenn=min(len(l1),len(l2))
    return [(l1[i]-l2[i])/s for i in range(lenn)]

#APR 5, 9.28 AM
def final_position(desired_velocity,current_foot_position,r_body,hip_yaw_location,swing_time,foot_state):
    #desired_velocity=3 dimensional (in robot frame)=lists
    #current_position=foot position (1 leg at a time)=lists
    global dtMPC
    current_foot_position=np.array(current_foot_position)
    desired_velocity=np.array(desired_velocity)
    hip_yaw_location=np.array(hip_yaw_location)
    world_velocity=np.dot(np.transpose(r_body),desired_velocity)#line 50

    v_des_robot=np.array([desired_velocity[0],desired_velocity[1],0])
    v_des_world = np.dot(np.transpose(r_body),v_des_robot)
    pf=current_foot_position+np.dot(np.transpose(r_body),hip_yaw_location)+world_velocity*swing_time

    #formulae below used to compute swing positions
    current_world_velocity=world_velocity
    p_rel_max = 0.4
    pfx_rel = world_velocity[0]*0.5*foot_state*dtMPC+0.02*(current_world_velocity[0]-world_velocity[0])
    pfy_rel = world_velocity[1]*0.5*foot_state*dtMPC+0.02*(current_world_velocity[1]-world_velocity[1])

    pfx_rel = min(max(pfx_rel,-p_rel_max),p_rel_max)
    pfy_rel = min(max(pfy_rel,-p_rel_max),p_rel_max)
    pf[0] += pfx_rel
    pf[1] += pfy_rel #+interleave_y[i] * v_abs * interleave_gain;
    pf[2] = -0.0

    return pf

def cross_mat(M,r):
    #I_inv 3x3,r 3x1
    v=np.array([[0, -r[2], r[1]],[r[2], 0, -r[0]],[-r[1], r[0], 0]])
    return np.dot(M,v)

def dh_transform(theta, d, a, alpha):
    """
    Compute Denavit-Hartenberg transformation matrix.
    """
    cos_theta = np.cos(theta)
    sin_theta = np.sin(theta)
    cos_alpha = np.cos(alpha)
    sin_alpha = np.sin(alpha)

    T = np.array([
        [cos_theta, -sin_theta * cos_alpha,  sin_theta * sin_alpha, a * cos_theta],
        [sin_theta,  cos_theta * cos_alpha, -cos_theta * sin_alpha, a * sin_theta],
        [0,          sin_alpha,             cos_alpha,             d],
        [0,          0,                     0,                     1]
    ])

    return T

def forward_kinematics(thetas, lengths):
    """
    Compute forward kinematics for bipedal leg with 8 DOF.
    """
    # Define DH parameters for each joint
    dh_params = [
        (np.pi/2, 0, 0, thetas[0]),             # Hip abduction
        (0, lengths[0], 0, thetas[1]),          # Hip flexion
        (0, lengths[1], 0, thetas[2]),          # Knee
        (-np.pi/2, 0, 0, thetas[3]),            # Ankle
        (np.pi/2, 0, 0, thetas[4]),             # Hip abduction
        (0, lengths[0], 0, thetas[5]),          # Hip flexion
        (0, lengths[1], 0, thetas[6]),          # Knee
        (-np.pi/2, 0, 0, thetas[7])             # Ankle
    ]

    # Initialize transformation matrix
    T = np.eye(4)

    poses = []

    # Compute transformation matrix by multiplying DH matrices
    #for left leg
    for i in range(4):
        T = np.dot(T, dh_transform(*dh_params[i]))
        poses.append(T)
    #for right leg
    T = np.eye(4)
    for i in range(4):
        T = np.dot(T, dh_transform(*dh_params[i + 4]))
        poses.append(T)

    return T, poses

waist,pelvis,thigh,shank,foot=0,0,0,0,0
def leg_mass_distribution(sex):
    #2kg waist,1kg pelvis, 1.5kg thigh, shank,1kg foot
    global waist,pelvis,thigh,shank,foot
    all=waist+2*(pelvis+thigh+shank+foot)
    if sex=='robot':
        return [0,thigh/all,shank/all,foot/all]
    #sex=male/female
    #https://exrx.net/Kinesiology/Segments, deLeva
    dict_mean_measurements={'shank_weight_male':4.33/100,'shank_weight_female':4.81/100,
                            'thigh_weight_male':14.16/100, 'thigh_weight_female':14.78/100,
                           'trunk_weight_male':43.46/100,'trunk_weight_female':42.58/100,
                            'thigh_length_male':23.2/100,'thigh_length_female':24.9/100,
                       'shank_length_male':24.7/100,'shank_length_female':25.7/100,
                            'leg_length_male':47.9/100,'leg_length_female':50.3/100,
                            'trunk_length_male':30/100,'trunk_length_female':29/100,
                           'foot_weight_male':1.37/100,'foot_weight_female':1.29/100}

    if sex not in ['male','female']:
        return [0,0,0,0]

    thigh_percent = dict_mean_measurements['thigh_weight_'+sex]
    shank_percent =dict_mean_measurements['shank_weight_'+sex]
    foot_percent = dict_mean_measurements['foot_weight_'+sex]

    #skip hip abduction when calculating the CoM
    return [0, thigh_percent, shank_percent, foot_percent]

def euler_to_rotation(r,p,y):
    #roll,pich,yaw
    Rx=np.array([[1, 0, 0],[0, np.cos(r), -np.sin(r)],[0, np.sin(r), np.cos(r)]])
    Ry=np.array([[np.cos(p), 0, np.sin(p)],[0, 1, 0],[-np.sin(p), 0, np.cos(p)]])
    Rz= np.array([[np.cos(y), -np.sin(y), 0],[np.sin(y), np.cos(y), 0],[0, 0, 1]])
    Rb=np.array([[np.cos(y)*np.cos(p), -np.sin(y), 0],[np.sin(y)*np.cos(p), np.cos(y), 0],[-np.sin(p), 0, 1]])
    det_mat=np.linalg.det(Rb)
    R=np.eye(3)
    if abs(det_mat)>0.0001:
        R = inv(Rb)
    return R

def com(lst_angls,leg_length,sex):
    #angles=[hip abduction,hip,knee,ankle], first right, second left
    _,r_hip_ang,r_knee_ang,r_ankle_ang,_,l_hip_ang,l_knee_ang,l_ankle_ang=lst_angls
    th = np.array([0, r_hip_ang,r_knee_ang,r_ankle_ang,
                   0, l_hip_ang,l_knee_ang,l_ankle_ang])
    #APR 5, 10.08 AM
    end_effector, poses = forward_kinematics(th, [leg_length,leg_length])
    leg_masses = leg_mass_distribution(sex)
    leg_masses *= 2
    com_position_sum = np.zeros(3)
    for pose, mass in zip(poses, leg_masses):
        # Extract position and orientation from pose
        position = pose[:3, 3]
        orientation = pose[:3, :3]
        com_position_sum += mass * position

    left_foot_pos = poses[3][:3, 3]
    right_foot_pos = poses[-1][:3, 3]
    #if finding com of the entire body (including upper); if using this, would need to include the com of the upper body
    #com_position_sum /= body_weight
    #if finding com of just the lower legs (assuming lower body is half of total body weight)
    dict_mean_measurements={'shank_weight_male':4.33/100,'shank_weight_female':4.81/100,
                            'thigh_weight_male':14.16/100, 'thigh_weight_female':14.78/100,
                           'trunk_weight_male':43.46/100,'trunk_weight_female':42.58/100,
                            'thigh_length_male':23.2/100,'thigh_length_female':24.9/100,
                       'shank_length_male':24.7/100,'shank_length_female':25.7/100,
                            'leg_length_male':47.9/100,'leg_length_female':50.3/100,
                            'trunk_length_male':30/100,'trunk_length_female':29/100,
                           'foot_weight_male':1.37/100,'foot_weight_female':1.29/100}
    lower_body_percent=1
    #2kg waist,1kg pelvis, 1.5kg thigh, shank,1kg foot
    if sex=='robot':
        lower_body_percent=10/12
    if sex in ['male','female']:
        lower_body_percent=1-dict_mean_measurements['trunk_weight_'+sex]
    com_position_sum /= lower_body_percent

    return com_position_sum.tolist(),right_foot_pos.tolist(),left_foot_pos.tolist()

def euler_angles(orientation_matrix):
    r_11,r_12,r_13=orientation_matrix[0,:]#row
    r_21,r_22,r_23=orientation_matrix[1,:]#row
    r_31,r_32,r_33=orientation_matrix[2,:]#row
    beta=np.arctan2(-r_31,np.sqrt(r_11**2+r_21**2))#[-pi,pi]
    beta2=np.arctan2(-r_31,-np.sqrt(r_11**2+r_21**2))
    c_beta=np.cos(beta)
    c_beta2=np.cos(beta2)
    if abs(c_beta)<1/np.power(10,4):
        c_beta=0.0001
    if abs(c_beta2)<1/np.power(10,4):
        c_beta2=0.0001
    alpha=np.arctan2(r_21/c_beta,r_11/c_beta)
    gamma=np.arctan2(r_32/c_beta,r_33/c_beta)
    alpha2=np.arctan2(r_21/c_beta2,r_11/c_beta2)
    gamma2=np.arctan2(r_32/c_beta2,r_33/c_beta2)
    return [alpha,beta,gamma],[alpha2,beta2,gamma2]

def foot_rotation_matrix(q):
    #q=hip yaw,hip roll,thigh,knee,ankle: 1st zeroed out
    #q=q[:2]+[0]+q[2:]
    q=[0]+q
    r11=-1.0*np.sin(q[4])*(np.cos(q[3])*(np.cos(q[0])*np.sin(q[2]) + np.cos(q[2])*np.sin(q[0])*np.sin(q[1])) + np.sin(q[3])*(np.cos(q[0])*np.cos(q[2]) - 1.0*np.sin(q[0])*np.sin(q[1])*np.sin(q[2]))) - np.cos(q[4])*(1.0*np.sin(q[3])*(np.cos(q[0])*np.sin(q[2]) + np.cos(q[2])*np.sin(q[0])*np.sin(q[1])) - np.cos(q[3])*(np.cos(q[0])*np.cos(q[2]) - 1.0*np.sin(q[0])*np.sin(q[1])*np.sin(q[2])))
    r12=-1.0*np.cos(q[1])*np.sin(q[0])
    r13=np.cos(q[4])*(np.cos(q[3])*(np.cos(q[0])*np.sin(q[2]) + np.cos(q[2])*np.sin(q[0])*np.sin(q[1])) + np.sin(q[3])*(np.cos(q[0])*np.cos(q[2]) - 1.0*np.sin(q[0])*np.sin(q[1])*np.sin(q[2]))) - np.sin(q[4])*(1.0*np.sin(q[3])*(np.cos(q[0])*np.sin(q[2]) + np.cos(q[2])*np.sin(q[0])*np.sin(q[1])) - np.cos(q[3])*(np.cos(q[0])*np.cos(q[2]) - 1.0*np.sin(q[0])*np.sin(q[1])*np.sin(q[2])))
    r21=np.cos(q[4])*(np.cos(q[3])*(np.cos(q[2])*np.sin(q[0]) + np.cos(q[0])*np.sin(q[1])*np.sin(q[2])) - 1.0*np.sin(q[3])*(np.sin(q[0])*np.sin(q[2]) - 1.0*np.cos(q[0])*np.cos(q[2])*np.sin(q[1]))) - 1.0*np.sin(q[4])*(np.sin(q[3])*(np.cos(q[2])*np.sin(q[0]) + np.cos(q[0])*np.sin(q[1])*np.sin(q[2])) + np.cos(q[3])*(np.sin(q[0])*np.sin(q[2]) - 1.0*np.cos(q[0])*np.cos(q[2])*np.sin(q[1])))
    r22=np.cos(q[0])*np.cos(q[1])
    r23=np.cos(q[4])*(np.sin(q[3])*(np.cos(q[2])*np.sin(q[0]) + np.cos(q[0])*np.sin(q[1])*np.sin(q[2])) + np.cos(q[3])*(np.sin(q[0])*np.sin(q[2]) - 1.0*np.cos(q[0])*np.cos(q[2])*np.sin(q[1]))) + np.sin(q[4])*(np.cos(q[3])*(np.cos(q[2])*np.sin(q[0]) + np.cos(q[0])*np.sin(q[1])*np.sin(q[2])) - 1.0*np.sin(q[3])*(np.sin(q[0])*np.sin(q[2]) - 1.0*np.cos(q[0])*np.cos(q[2])*np.sin(q[1])))
    r31=-1.0*np.sin(q[2] + q[3] + q[4])*np.cos(q[1])
    r32=np.sin(q[1])
    r33=np.cos(q[2] + q[3] + q[4])*np.cos(q[1])
    R=np.array([[r11,r12,r13],[r21,r22,r23],[r31,r32,r33]])
    return R

def get_trajectories(foot_states,I_body,h,m,weights,last_angles,last_feet,last_x,wanted_x):
    #h=length of horizon,foot_states: 0=swing,1=stance, trajectories=list of [x,u]
    global lt,lh,mu
    #x,u, x=[big_theta,p,p_prime,big_omega,g]=13 elements, u=[F1,F2,M1,M2]=12 elements
    roll,pitch,yaw=last_x[:3]
    R_b=euler_to_rotation(roll,pitch,yaw)
    R_yaw=np.array([[np.cos(yaw),-np.sin(yaw),0],[np.sin(yaw),np.cos(yaw),0],[0,0,1]])
    #[x,u]=13+12=25,X=[x's,u's]
    """
    min 1/2 x^TPx+q^Tx subject to Gx<=h, Ax=b,lb<=x<=ub
    """
    #P
    P=np.zeros((25*h,25*h))
    weights_x,weights_u=weights[:13],weights[13:]
    S=np.zeros((13*h,13*h))
    for i in range(h):
        i1,i2=13*i,13*(i+1)
        S[i1:i2,i1:i2]=np.diag(weights_x)
    R=np.zeros((12*h,12*h))
    for i in range(h):
        i1,i2=12*i,12*(i+1)
        R[i1:i2,i1:i2]=np.diag(weights_u)
    P[:13*h,:13*h]=S
    P[13*h:,13*h:]=R
    #lb,ub
    lb,ub=[-1000 for _ in range(25*h)],[1000 for _ in range(25*h)]

    #A
    A=np.zeros((13*h,25*h))
    A_c=np.zeros((13,13))
    A_c[0:3,6:9]=R_yaw
    A_c[3:6,6:9]=np.eye(3)
    A_c[9:12,12]=np.array([[0,0,-1]])
    A_init=np.eye(13)+dt*A_c
    com_pos=last_x[3:6]
    foot1,foot2=last_feet[0],last_feet[1]
    B_c=np.zeros((13,12))
    I_world=np.dot(np.dot(R_b,I_body),np.transpose(R_b))
    I_inv=inv(I_world)
    B_c[6:9,:3]=cross_mat(I_inv,foot1)
    B_c[6:9,3:6]=cross_mat(I_inv,foot2)
    B_c[6:9,6:9]=I_inv
    B_c[9:12,:3]=np.eye(3)/m
    B_c[9:12,3:6]=np.eye(3)/m
    B_c=B_c*dt
    for i in range(h):
        i1,i2,i3,i4,i5=13*i,13*(i+1),13*(i+2),13*h+12*i,13*h+12*(i+1)
        A[i1:i2,i1:i2]=np.eye(13)
        if i<h-1:
            A[i2:i3,i1:i2]=A_c
        A[i1:i2,i4:i5]=B_c
    #b
    b=np.zeros((13*h,1))
    b[:13,0]=np.dot(A_init,last_x)
    #q
    q=np.zeros((25*h,1))
    for i in range(h):
        i1,i2=13*h,13*h+13
        q[i1:i2,0]=[weights[j]*wanted_x[i][j] for j in range(13)]
    #h=2*16*h,1
    h_v=np.zeros((32*h,1))
    U_b,L_b=[0 for _ in range(16*h)],[0 for _ in range(16*h)]
    big_number=np.power(10,6)
    f_max=10
    for leg in range(2):
        for i in range(h):
            for j in range(4):
                U_b[8*leg + j + 16*i] = big_number
                L_b[8*leg + j + 16*i] = 0
            U_b[8*leg + 4 + 16*i] = 0.01
            U_b[8*leg + 5 + 16*i] = 0
            U_b[8*leg + 6 + 16*i] = 0
            U_b[8*leg + 7 + 16*i] = f_max * foot_states[i][leg]
            L_b[8*leg + 4 + 16*i] = 0
            L_b[8*leg + 5 + 16*i] = big_number
            L_b[8*leg + 6 + 16*i] = big_number
            L_b[8*leg + 7 + 16*i] = 0
    U_b=np.array(U_b)
    L_b=np.array(L_b)
    F_control=np.zeros((16,12))
    moment_selection=np.array([[1,0,0]])
    lt_vec,lh_vec=np.array([[0,0,lt]]),np.array([[0,0,lh]])
    M_vec=np.array([[0,1,0]])
    R_foot_L,R_foot_R=foot_rotation_matrix(last_angles[:4]),foot_rotation_matrix(last_angles[4:])
    R=R_b
    #leg 1=left
    F_control[0,:]= [-mu, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    F_control[1,:]= [mu, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    F_control[2,:]= [0, -mu, 1,  0, 0, 0, 0, 0, 0, 0, 0, 0]
    F_control[3,:]= [0,  mu, 1,  0, 0, 0, 0, 0, 0, 0, 0, 0]
    F_control[4,:]= np.array([0, 0, 0, 0, 0, 0]+(np.dot(np.dot(moment_selection,np.transpose(R_foot_L)),np.transpose(R))).tolist()[0]+[ 0, 0, 0])
    F_control[5,:]= np.array((-np.dot(np.dot(lt_vec,np.transpose(R_foot_L)),np.transpose(R))).tolist()[0]+[0, 0, 0]+np.dot(np.dot(M_vec,np.transpose(R_foot_L)),np.transpose(R)).tolist()[0]+[0, 0, 0])
    F_control[6,:]=np.array((-np.dot(np.dot(lh_vec,np.transpose(R_foot_L)),np.transpose(R))).tolist()[0]+[0, 0, 0]+(-np.dot(np.dot(M_vec,np.transpose(R_foot_L)),np.transpose(R))).tolist()[0]+ [0, 0, 0])
    F_control[7,:]=[0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    #leg2=right
    F_control[0+8,:]= [ 0, 0, 0,-mu, 0, 1, 0, 0, 0, 0, 0, 0]
    F_control[1+8,:]= [0, 0, 0,mu, 0, 1, 0, 0, 0, 0, 0, 0]
    F_control[2+8,:]= [0, 0, 0,0, -mu, 1,  0, 0, 0, 0, 0, 0]
    F_control[3+8,:]= [0, 0, 0, 0,  mu, 1,  0, 0, 0, 0, 0, 0]
    F_control[4+8,:]= [0, 0, 0,0, 0, 0, 0, 0, 0]+(np.dot(np.dot(moment_selection,np.transpose(R_foot_R)),np.transpose(R))).tolist()[0]
    F_control[5+8,:]= [0, 0, 0]+(-np.dot(np.dot(lt_vec,np.transpose(R_foot_R)),np.transpose(R))).tolist()[0]+[0, 0, 0]+(np.dot(np.dot(M_vec,np.transpose(R_foot_R)),np.transpose(R))).tolist()[0]
    F_control[6+8,:]=[0, 0, 0]+(-np.dot(np.dot(lh_vec,np.transpose(R_foot_R)),np.transpose(R))).tolist()[0]+[0, 0, 0]+(-np.dot(np.dot(M_vec,np.transpose(R_foot_R)),np.transpose(R))).tolist()[0]
    F_control[7+8,:]=[0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0]

    #Gx<=h: x=25hx1, f_control=16x12; h=h_v
    G=np.zeros((2*16*h,25*h))
    for i in range(h):
        i1,i2=25*i+13,25*i+25
        i3,i4,i5=16*2*i,16*(2*i+1),16*(2*i+2)
        G[i3:i4,i1:i2]=F_control
        G[i4:i5,i1:i2]=F_control

    #solve
    trajectories = solve_qp(P, q, G, h_v, A, b, solver="cvxopt")
    return trajectories

def vel_euler(angles,der_angles):
    phi,theta,psi=angles#roll,pitch,yaw
    S_r=np.array([[np.sin(theta)*np.sin(psi),np.cos(psi),0],[np.sin(theta)*np.cos(psi),-np.sin(psi),0],[np.cos(theta),0,1]])
    return np.dot(S_r,der_angles).tolist()

def make_foot_states(h,keep_same):
    lst=[]
    h1=int((h+1)/keep_same)
    for i in range(h1):
        lst+=[[i%2,(i+1)%2] for _ in range(keep_same)]
    return lst

def make_x3(h):
    #v_des_robot=3x1, velocity for Euler angles
    global v_des_robot,v_des_robot_feet,yaw_vel,leg_length_robot,callback_manager
    curr_euler_angls=[callback_manager.model_euler_angles['roll'],
             callback_manager.model_euler_angles['pitch'],
             callback_manager.model_euler_angles['yaw']]#APR 5, 10.05 AM: get current euler angles
    
    rBody=euler_to_rotation(curr_euler_angls[0],curr_euler_angls[1],curr_euler_angls[2])
    #APR 5, 10.13 AM
    curr_angles=[callback_manager.encoder_values['yr_l_pel_joint'],
           callback_manager.encoder_values['yr_l_hip_joint'],
           callback_manager.encoder_values['yr_l_kne_joint'],
           callback_manager.encoder_values['yr_l_ank_joint'],
           callback_manager.encoder_values['yr_r_pel_joint'],
           callback_manager.encoder_values['yr_r_hip_joint'],
           callback_manager.encoder_values['yr_r_kne_joint'],
           callback_manager.encoder_values['yr_r_ank_joint']]#current angles: [0,pel,hip,knee,ankle]
    com_position,_,_=com(curr_angles,leg_length_robot,'robot')#APR 5, 10.15 AM: current CoM
    v_des_robot[-1]=0
    if type(v_des_robot)==type([]):
        v_des_robot=np.array(v_des_robot)
    v_des_world = np.dot(np.transpose(rBody),v_des_robot)
    max_pos_error = 0.05
   
    p= com_position
    v_des_world_feet=np.dot(np.transpose(rBody),v_des_robot_feet)
    world_position_desired=p+dt*v_des_world_feet
    xStart = world_position_desired[0]
    yStart = world_position_desired[1]
    if xStart - p[0] > max_pos_error:
       xStart = p[0] + max_pos_error
    if p[0] - xStart > max_pos_error:
       xStart = p[0] - max_pos_error

    if yStart - p[1] > max_pos_error:
        yStart =p[1] + max_pos_error
    if p[1] - yStart > max_pos_error:
       yStart = p[1] - max_pos_error

    world_position_desired[0] = xStart
    world_position_desired[1] = yStart

    ori_des_world=curr_euler_angls+dt*v_des_world_feet

    trajInitial= [ori_des_world[0],  #0
                  ori_des_world[1],    #1
                  0.0,    #2
                  xStart,                         #3
                  yStart,                         #4
                  0.55 ,  #5
                  0,  #6
                  0, #7
                  yaw_vel,   #8
                  v_des_world[0],                           #9
                  v_des_world[1],                           #10
                  0]                                      #11
    trajAll=[0 for _ in range(12*h)]
    for i in range(h):
      for j in range(12):
        trajAll[12 * i + j] = trajInitial[j]
      #APR 5, 10.13 AM: set. ... replaced by com_position
      if i == 0: #start at current position  TODO consider not doing this
        trajAll[0] = curr_euler_angls[0]
        trajAll[1] = curr_euler_angls[1]
        trajAll[2] = curr_euler_angls[2]
        trajAll[3] = com_position[0]
        trajAll[4] = com_position[1]
        trajAll[5] = com_position[2]
      else:
        if v_des_world[0] == 0:
            trajAll[12*i + 3] = trajInitial[3] + i * dtMPC * v_des_world[0]
        else:
            trajAll[12*i + 3] = com_position[0] + i * dtMPC * v_des_world[0]
        if v_des_world[1] == 0:
            trajAll[12*i + 4] = trajInitial[4] + i * dtMPC * v_des_world[1]
        else:
            trajAll[12*i + 4] = com_position[1] + i * dtMPC * v_des_world[1]
        if yaw_vel == 0:
              trajAll[12*i + 2] = trajInitial[2]
        else:
              trajAll[12*i + 2] = curr_euler_angls[2] + i * dtMPC * yaw_vel

    trajAll=[trajAll[12*i:(12*i+12)]+[9.61] for i in range(h)]
    return trajAll

""""
HERE: Apr 4, 8.19 PM
"""

def solve_problem():
    #last_x: []
    #APR 5, 10.01 AM
    global h,keep_same,I_body,m,weights,callback_manager
    left_leg_pose = callback_manager.call_compute_left_foot_position(
        [callback_manager.encoder_values['yr_l_pel_joint'],
        callback_manager.encoder_values['yr_l_hip_joint'],
        callback_manager.encoder_values['yr_l_kne_joint'],
        callback_manager.encoder_values['yr_l_ank_joint'],])
    
    right_leg_pose = callback_manager.call_compute_right_foot_position(
        [callback_manager.encoder_values['yr_r_pel_joint'],
        callback_manager.encoder_values['yr_r_hip_joint'],
        callback_manager.encoder_values['yr_r_kne_joint'],
        callback_manager.encoder_values['yr_r_ank_joint'],])

    last_feet=[[left_leg_pose.x,left_leg_pose.y,left_leg_pose.z],
            [right_leg_pose.x,right_leg_pose.y,right_leg_pose.z]]#FOOT POSITIONS: LIST OF LEFT,RIGHT FOOT POSITIONS
    
    # left_foot_pos,right_foot_pos=[],[]#APR 5, 10.01 AM: CHANGE: GET CURRENT FOOT POSITIONS
    # last_feet=[left_foot_pos,right_foot_pos]

    #inputs
    #x=[big_theta,p,p_prime,big_omega,g]=13 elements, u=[F1,F2,M1,M2]=12 elements
    wanted_x=make_x3(h)
    foot_states=make_foot_states(h,keep_same)
    last_x=wanted_x[-1]
    #hip yaw, hip roll, thigh, knee, ankle
    last_angles=[callback_manager.encoder_values['yr_l_pel_joint'],
           callback_manager.encoder_values['yr_l_hip_joint'],
           callback_manager.encoder_values['yr_l_kne_joint'],
           callback_manager.encoder_values['yr_l_ank_joint'],
           callback_manager.encoder_values['yr_r_pel_joint'],
           callback_manager.encoder_values['yr_r_hip_joint'],
           callback_manager.encoder_values['yr_r_kne_joint'],
           callback_manager.encoder_values['yr_r_ank_joint']]#APR 5, 10.03 AM:CURRENT JOINT ANGLES: 0+angles

    all_x_u=get_trajectories(foot_states,I_body,h,m,weights,last_angles,last_feet,last_x,wanted_x)
    if not type(all_x_u)==type(np.zeros((1,1))):
        return []
    needed_u=all_x_u[-12:]#F,F,M,M; each leg has 6 of them;:3,3:6,6:9,9:
    return needed_u

def get_torques(sides,last_angles):
    global needed_u,callback_manager
    last_angles=[callback_manager.encoder_values['yr_l_pel_joint'],
           callback_manager.encoder_values['yr_l_hip_joint'],
           callback_manager.encoder_values['yr_l_kne_joint'],
           callback_manager.encoder_values['yr_l_ank_joint'],
           callback_manager.encoder_values['yr_r_pel_joint'],
           callback_manager.encoder_values['yr_r_hip_joint'],
           callback_manager.encoder_values['yr_r_kne_joint'],
           callback_manager.encoder_values['yr_r_ank_joint']]#READ ANGLES: [0,pelvis,hip,knee]
    torques={}
    if needed_u==[]:
        return {}
    R_left,R_right=foot_rotation_matrix(last_angles[:4]),foot_rotation_matrix(last_angles[4:])
    R_left=np.transpose(R_left)
    R_right=np.transpose(R_right)
    for foot in ['l','r']:
        no_joints=4#paper had it 5
        # J_mat=np.zeros((6,no_joints))
        # J_mat[:3,:no_joints]=Jv#APR 5, 9.48 AM:linear velocity jacobian
        # J_mat[3:,:no_joints]=Jw#APR 5, 9.48 AM:angular velocity jacobian
        print(callback_manager.jacobians_dict['l_foot_bottom'])
        J_mat = callback_manager.jacobians_dict['{}_foot_bottom'.format(foot)] 
        # print(J_mat)
        R_left=np.transpose(R_left)
        vect=np.zeros((6,1))
        if foot=='l':
            vect[:3,0],vect[3:,0]=np.dot(R_left,needed_u[:3]),np.dot(R_left,needed_u[6:9])
        else:
            vect[:3,0],vect[3:,0]=np.dot(R_right,needed_u[:3]),np.dot(R_right,needed_u[6:9])
        torq=np.dot(np.transpose(J_mat),vect)
        torques[foot]=torq
    if sides=='l':
      return torques['l']
    if sides=='r':
      return torques['r']
    return torques

def poly_curve(v1,v2,phi):
    v1=np.array(v1)
    v2=np.array(v2)
    #APR 5, 9.44 AM
    return ((v2-v1)*(np.power(phi,3)+3*np.power(phi,2)*(1-phi))+v1).tolist()

def walk(torques,no_steps):
    global desired_velocity,swing_time,no_steps_swing,dt_swing,callback_manager
    fsm=[[i%2,(i+1)%2] for i in range(no_steps)]
    for j in range(no_steps):#APR 5, 10.56 AM
      
      state_l,state_r=fsm[j]
      if state_l==0:
          lead,follow='r','l'
      else:
          lead,follow='l','r'
      last_angles=[callback_manager.encoder_values['yr_l_pel_joint'],
           callback_manager.encoder_values['yr_l_hip_joint'],
           callback_manager.encoder_values['yr_l_kne_joint'],
           callback_manager.encoder_values['yr_l_ank_joint'],
           callback_manager.encoder_values['yr_r_pel_joint'],
           callback_manager.encoder_values['yr_r_hip_joint'],
           callback_manager.encoder_values['yr_r_kne_joint'],
           callback_manager.encoder_values['yr_r_ank_joint']]#READ ANGLES: [0,pelvis,hip,knee]x2
      torques=get_torques(lead,last_angles)
      send_torques(torques)#APR 5, 9.46 AM: SEND TORQUES
      #APR 5, 9.28 AM
      left_leg_pose = callback_manager.call_compute_left_foot_position(
          [callback_manager.encoder_values['yr_l_pel_joint'],
           callback_manager.encoder_values['yr_l_hip_joint'],
           callback_manager.encoder_values['yr_l_kne_joint'],
           callback_manager.encoder_values['yr_l_ank_joint'],])
      
      right_leg_pose = callback_manager.call_compute_right_foot_position(
          [callback_manager.encoder_values['yr_r_pel_joint'],
           callback_manager.encoder_values['yr_r_hip_joint'],
           callback_manager.encoder_values['yr_r_kne_joint'],
           callback_manager.encoder_values['yr_r_ank_joint'],])

      curr_pos=[[left_leg_pose.x,left_leg_pose.y,left_leg_pose.z],
                [right_leg_pose.x,right_leg_pose.y,right_leg_pose.z]]#FOOT POSITIONS: LIST OF LEFT,RIGHT FOOT POSITIONS
      #APR 5, 9.28 AM
      r,p,y=[callback_manager.model_euler_angles['roll'],
             callback_manager.model_euler_angles['pitch'],
             callback_manager.model_euler_angles['yaw']]#CURRENT EULER ANGLES
      #APR 5, 9.28 AM
      r_body=euler_to_rotation(r,p,y)
      left_hip_pose = callback_manager.call_compute_left_hip_position(
            [callback_manager.encoder_values['yr_l_pel_joint'],
            callback_manager.encoder_values['yr_l_hip_joint']])
      
      right_hip_pose = callback_manager.call_compute_right_hip_position(
            [callback_manager.encoder_values['yr_r_pel_joint'],
            callback_manager.encoder_values['yr_r_hip_joint'],])
      
      hip_yaw_location=[[left_hip_pose.x,left_hip_pose.y,left_hip_pose.z],
                [right_hip_pose.x,right_hip_pose.y,right_hip_pose.z]]
    #   hip_yaw_location=[]#REPLACE WITH current hip location

      if lead=='l':
        final_pos=final_position(desired_velocity,curr_pos[0],r_body,hip_yaw_location[0],swing_time,1)
        # print(curr_pos[0],final_pos)
      elif lead=='r':
        final_pos=final_position(desired_velocity,curr_pos[1],r_body,hip_yaw_location[1],swing_time,1)
        # print(curr_pos[1],final_pos)
      saved_angles=[last_angles]
      saved_positions=[curr_pos]
      for i in range(no_steps_swing):
          phi=i/(no_steps_swing-1)
          if lead =='l': new_pos=poly_curve(curr_pos[0],final_pos,phi)
          if lead =='r': new_pos=poly_curve(curr_pos[1],final_pos,phi)
          
          saved_positions.append(new_pos)
        #   last_angles=inverse_kinematics(new_pos)#INVERSE KINEMATICS: RETURN list
          if lead == 'l':
            # print('l',new_pos)
            left_angles = [*callback_manager.call_solve_ik_left_foot(new_pos[0],0.275,new_pos[2],roll=0,pitch=0,yaw=0)]
            right_angles = last_angles[4:]
            last_angles = left_angles + right_angles

          else: 
            # print('r',new_pos)
            left_angles = last_angles[:4]

            right_angles = [*callback_manager.call_solve_ik_right_foot(new_pos[0],-0.275,new_pos[2],roll=0,pitch=0,yaw=0)]
            last_angles = left_angles + right_angles
          
        #   print('last_angles',last_angles)
          torques=get_torques(lead,last_angles)
        #   print('torques',torques)
          lenn=len(saved_positions[-1])
          vel_pos=[(new_pos[j]-saved_positions[-1][j])/dt_swing for j in range(lenn)]

          end1,end2=0,4
          joint_velocities=[]#APR 5, 11.22 AM,
          if lead=='r':
              end1,end2=4,8

          joint_velocities=[callback_manager.joint_angular_vels['yr_l_pel_joint'],
           callback_manager.joint_angular_vels['yr_l_hip_joint'],
           callback_manager.joint_angular_vels['yr_l_kne_joint'],
           callback_manager.joint_angular_vels['yr_l_ank_joint'],
           callback_manager.joint_angular_vels['yr_r_pel_joint'],
           callback_manager.joint_angular_vels['yr_r_hip_joint'],
           callback_manager.joint_angular_vels['yr_r_kne_joint'],
           callback_manager.joint_angular_vels['yr_r_ank_joint']]#UPDATE ANGLES:0,pelvis,hip,knee,ankle
          
          cur_angles = [callback_manager.encoder_values['yr_l_pel_joint'],
           callback_manager.encoder_values['yr_l_hip_joint'],
           callback_manager.encoder_values['yr_l_kne_joint'],
           callback_manager.encoder_values['yr_l_ank_joint'],
           callback_manager.encoder_values['yr_r_pel_joint'],
           callback_manager.encoder_values['yr_r_hip_joint'],
           callback_manager.encoder_values['yr_r_kne_joint'],
           callback_manager.encoder_values['yr_r_ank_joint']]#UPDATE ANGLES:0,pelvis,hip,knee,ankle
          
          K_p,K_d=[0.01 for _ in range(8)],[0.01 for _ in range(8)]#virtually irrelevant
        #   print(last_angles,cur_angles,joint_velocities)

          corr=[K_p[t]*(last_angles[t]-cur_angles[t])+K_d[t]*(0-joint_velocities[t]) for t in range(end1,end2)]
          counter=0
          for t in torques.keys():
              torques[t]+=corr[counter]
              counter+=1
          #K_p,K_d gains
          #1.Kp*(fut_foot_pos-curr)+Kd*(vel_foot_pos-curr): add this to torque as J_v transpose*this
          #2.Kp*(fut_angls_pos-curr)+Kd*(vel_angl-curr): add this to torque
          send_torques(torques)#APR 5, 9.49 AM: set torques

def send_torques(torques):
    global controller_manager
    for side in torques:
        if side == 'l':
            joint_torques = {'yr_l_pel_joint':torques[0], 'yr_l_hip_joint':-torques[1], 'yr_l_kne_joint':torques[2], 'yr_l_ank_joint':-torques[3]}
            controller_manager.set_torques(joint_torques)
        elif side == 'r':
            joint_torques = {'yr_r_pel_joint':-torques[0], 'yr_r_hip_joint':-torques[1], 'yr_r_kne_joint':torques[2], 'yr_r_ank_joint':-torques[3]}
            controller_manager.set_torques(joint_torques)    


#2kg waist,1kg pelvis, 1.5kg thigh, shank,1kg foot
waist,pelvis,thigh,shank,foot=2,1,1.5,1.5,1
m=waist+2*(pelvis+thigh+shank+foot)
thigh_l = 0.468
shank_l = 0.468
foot_l = 0.15
leg_length_robot=thigh_l+shank_l+foot_l #CHANGE with robot configuration

#PARAMETERS TO TUNE
h=10
keep_same=5#keep_same a divisor of h: 1,2,5,10
I_body=np.eye(3)
#paper: Qk=diag[500,500,500,150,150,150,1,1,3,1,1,1,0],Rk=np.diag([1,1,1,1,1,1,5,5,5,5,5,5]×10−3.
weights=[500,500,500, 150,150,150, 1,1,3, 1,1,1,0]+[0.001 for _ in range(6)]+[0.005 for _ in range(6)]


#APR 5, 10.58 AM: this entire block
dt=0.001
torques={'l':[],'r':[]}
no_steps=4
no_steps_swing=10
desired_velocity=[0.01,0.01,0]
v_des_robot=desired_velocity
v_des_robot_feet=[0.2,0.1,0]
swing_time=0.3#seconds
dt_swing=0.01
needed_u=None
yaw_vel = 0.01
lt = 0.09 #
lh = 0.06 #
mu = 1.0 #Friction coef fo floor

Kp=np.diag([300,300,300])
Kp_stance=Kp*0
Kd=np.diag([10,10,10])
Kd_stance=Kd*0
dt=0.001
iterationsBetweenMPC=2#TO FIND
dtMPC = dt * iterationsBetweenMPC


#APR 5, 10.58 AM
rospy.sleep(3)
while not rospy.is_shutdown():
    needed_u=solve_problem()
    last_angles=[callback_manager.encoder_values['yr_l_pel_joint'],
           callback_manager.encoder_values['yr_l_hip_joint'],
           callback_manager.encoder_values['yr_l_kne_joint'],
           callback_manager.encoder_values['yr_l_ank_joint'],
           callback_manager.encoder_values['yr_r_pel_joint'],
           callback_manager.encoder_values['yr_r_hip_joint'],
           callback_manager.encoder_values['yr_r_kne_joint'],
           callback_manager.encoder_values['yr_r_ank_joint']]#UPDATE ANGLES:0,pelvis,hip,knee,ankle
    get_torques(last_angles,needed_u)
    walk(torques,no_steps)



