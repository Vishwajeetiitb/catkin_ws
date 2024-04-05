#!/usr/bin/env python3
import rospy
from sensor_msgs.msg import Imu, JointState
from geometry_msgs.msg import Quaternion
import tf
from std_msgs.msg import Float64
from yr_description.srv import ComputeLeftFootPosition, ComputeRightFootPosition, SolveIKLeftFoot, SolveIKRightFoot # type: ignore
from yr_description.msg import AllJacobians # type: ignore
import numpy as np
from gazebo_msgs.msg import ModelStates

class ExoCallbacks:
    def __init__(self):
        self.measurements = {}
        self.encoder_values = {}
        self.joint_angular_vels = {}
        self.model_euler_angles = {}
        self.jacobians_dict = {}
        self.setup_subscribers()
    
    def imu_callback(self,data, joint_name):
        """
        Callback function to process IMU data and store it in the measurements dictionary.
        """

        self.measurements[joint_name] = {
            'aX': data.linear_acceleration.x,
            'aY': data.linear_acceleration.y,
            'aZ': data.linear_acceleration.z,
            'vX': data.angular_velocity.x,
            'vY': data.angular_velocity.y,
            'vZ': data.angular_velocity.z,
        }
        # print('yr_l_ank_joint aZ',measurements['yr_l_ank_joint']['aZ'])

    def call_compute_left_foot_position(self,joint_angles):
        rospy.wait_for_service('compute_left_foot_position')
        try:
            compute_left_foot_position = rospy.ServiceProxy('compute_left_foot_position', ComputeLeftFootPosition)
            resp = compute_left_foot_position(joint_angles)
            return resp.foot_position
        except rospy.ServiceException as e:
            print("Service call failed: %s" % e)

    def call_compute_right_foot_position(self,joint_angles):
        rospy.wait_for_service('compute_right_foot_position')
        try:
            compute_right_foot_position = rospy.ServiceProxy('compute_right_foot_position', ComputeRightFootPosition)
            resp = compute_right_foot_position(joint_angles)
            return resp.foot_position
        except rospy.ServiceException as e:
            print("Service call failed: %s" % e)

    def call_compute_left_hip_position(self,joint_angles):
        rospy.wait_for_service('compute_left_hip_position')
        try:
            compute_left_foot_position = rospy.ServiceProxy('compute_left_hip_position', ComputeLeftFootPosition)
            resp = compute_left_foot_position(joint_angles)
            return resp.foot_position
        except rospy.ServiceException as e:
            print("Service call failed: %s" % e)

    def call_compute_right_hip_position(self,joint_angles):
        rospy.wait_for_service('compute_right_hip_position')
        try:
            compute_right_foot_position = rospy.ServiceProxy('compute_right_hip_position', ComputeRightFootPosition)
            resp = compute_right_foot_position(joint_angles)
            return resp.foot_position
        except rospy.ServiceException as e:
            print("Service call failed: %s" % e)


    def call_solve_ik_left_foot(self,x, y, z, roll, pitch, yaw):
        rospy.wait_for_service('solve_ik_left_foot')
        try:
            solve_ik = rospy.ServiceProxy('solve_ik_left_foot', SolveIKLeftFoot)
            resp = solve_ik(x, y, z, roll, pitch, yaw)
            return resp.joint_angles
        except rospy.ServiceException as e:
            print("Service call failed: %s" % e)
    

    def call_solve_ik_right_foot(self,x, y, z, roll, pitch, yaw):
        rospy.wait_for_service('solve_ik_right_foot')
        try:
            solve_ik = rospy.ServiceProxy('solve_ik_right_foot', SolveIKRightFoot)
            resp = solve_ik(x, y, z, roll, pitch, yaw)
            return resp.joint_angles
        except rospy.ServiceException as e:
            print("Service call failed: %s" % e)


    def encoder_callback(self,msg):
        self.encoder_values = dict(zip(msg.name, msg.position))
        self.joint_angular_vels = dict(zip(msg.name, msg.velocity))


    def model_eulers_callback(self,data):
        try:
            exo_index = data.name.index('exo')  # Find the index of 'exo'
            orientation_q = data.pose[exo_index].orientation
            quaternion = (
                orientation_q.x,
                orientation_q.y,
                orientation_q.z,
                orientation_q.w
            )
            euler = tf.transformations.euler_from_quaternion(quaternion)
            self.model_euler_angles['roll'] = euler[0]
            self.model_euler_angles['pitch'] = euler[1]
            self.model_euler_angles['yaw'] = euler[2]
            # rospy.loginfo("Euler angles of 'exo': roll: {:.2f}, pitch: {:.2f}, yaw: {:.2f}".format(euler[0], euler[1], euler[2]))
        except ValueError:
            rospy.logerr("Model 'exo' not found in the model states.")


    def all_jacobians_callback(self,data):
        self.jacobians_dict.clear()

        for name, jacobian_matrix_msg in zip(data.names, data.jacobians):
            jacobian_np = np.array(jacobian_matrix_msg.data).reshape(jacobian_matrix_msg.rows, jacobian_matrix_msg.columns)
            self.jacobians_dict[name] = jacobian_np
        


    def setup_subscribers(self):
        # Set up the IMU subscribers for each joint.
        joints = ['yr_l_ank_joint', 'yr_l_hip_joint', 'yr_l_kne_joint', 'yr_l_pel_joint', 'yr_r_ank_joint', 'yr_r_hip_joint', 'yr_r_kne_joint', 'yr_r_pel_joint']
        for joint in joints:
            rospy.Subscriber(f'/{joint}/imu_data', Imu, self.imu_callback, joint)

        #Set up the Ecnoder subscriber
        rospy.Subscriber("/exo/joint_states", JointState, self.encoder_callback)

        #Set up the Euler angles subscriber
        rospy.Subscriber("/gazebo/model_states", ModelStates, self.model_eulers_callback)
        
        #Set up jacobians subscriber
        rospy.Subscriber('/exo/all_jacobians', AllJacobians, self.all_jacobians_callback)