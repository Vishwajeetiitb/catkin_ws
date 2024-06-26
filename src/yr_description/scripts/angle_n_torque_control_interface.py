#!/usr/bin/env python3
from sensor_msgs.msg import JointState
import rospy
from std_msgs.msg import Float64
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint
from controller_manager_msgs.srv import SwitchController
import numpy as np
import time
from sensor_msgs.msg import Imu
from gazebo_msgs.msg import ModelStates
import tf.transformations
from yr_description.msg import FeetPositions  # type: ignore
import numpy as np
from yr_description.msg import AllJacobians # type: ignore
from geometry_msgs.msg import Point
from yr_description.srv import ComputeLeftFootPosition, ComputeRightFootPosition # type: ignore
from yr_description.srv import SolveIKLeftFoot, SolveIKRightFoot # type: ignore

encoder_values = {}
model_euler_angles = {} #roll pitch yaw is the sequence formate 
left_foot_pose = {}
right_foot_pose = {}
jacobians_dict = {}

# Initialize a dictionary to hold the IMU data for each joint
measurements = {
    'yr_l_ank_joint': {},
    'yr_l_hip_joint': {},
    'yr_l_kne_joint': {},
    'yr_l_pel_joint': {},
    'yr_r_ank_joint': {},
    'yr_r_hip_joint': {},
    'yr_r_kne_joint': {},
    'yr_r_pel_joint': {},
}

class ExoControllerManager:
    def __init__(self):
        # Define publishers for each torque and trajectory controller
        self.torque_publishers = {joint: rospy.Publisher(f'/exo/{joint}_torque_controller/command', Float64, queue_size=10)
                                for joint in ['yr_l_pel_joint', 'yr_l_hip_joint', 'yr_l_kne_joint', 'yr_l_ank_joint',
                                                'yr_r_pel_joint', 'yr_r_hip_joint', 'yr_r_kne_joint', 'yr_r_ank_joint']}

        self.trajectory_publishers = {joint: rospy.Publisher(f'/exo/{joint}_trajectory_controller/command', JointTrajectory, queue_size=10)
                                    for joint in ['yr_l_pel_joint', 'yr_l_hip_joint', 'yr_l_kne_joint', 'yr_l_ank_joint',
                                                    'yr_r_pel_joint', 'yr_r_hip_joint', 'yr_r_kne_joint', 'yr_r_ank_joint']}

        rospy.wait_for_service('/exo/controller_manager/switch_controller')
        self.switch_service = rospy.ServiceProxy('/exo/controller_manager/switch_controller', SwitchController)

        rospy.sleep(1)  # Ensure all publishers are set up

    def switch_controllers(self, start_controllers, stop_controllers):
        """Switches between torque and trajectory controllers."""
        try:
            self.switch_service(start_controllers=start_controllers, stop_controllers=stop_controllers, strictness=1)
            rospy.loginfo("Controllers switched.")
        except rospy.ServiceException as exc:
            rospy.logerr(f"Controller switching failed: {exc}")

    def set_torques(self, joint_torques):
        """Switches to the appropriate torque controllers and publishes torque commands."""
        start_controllers = [f'{joint}_torque_controller' for joint in joint_torques.keys()]
        stop_controllers = [f'{joint}_trajectory_controller' for joint in joint_torques.keys()]
        self.switch_controllers(start_controllers, stop_controllers)
        
        # Publish after switching
        for joint, torque in joint_torques.items():
            self.torque_publishers[joint].publish(Float64(torque))
            rospy.loginfo(f'Published torque {torque} for {joint}')

    def set_angles(self, joint_angles):
        """Switches to the appropriate trajectory controllers and publishes angle commands."""
        start_controllers = [f'{joint}_trajectory_controller' for joint in joint_angles.keys()]
        stop_controllers = [f'{joint}_torque_controller' for joint in joint_angles.keys()]
        self.switch_controllers(start_controllers, stop_controllers)
        
        # Publish after switching
        for joint, angle in joint_angles.items():
            msg = JointTrajectory()
            msg.joint_names = [joint]
            point = JointTrajectoryPoint(positions=[angle], time_from_start=rospy.Duration(3))
            msg.points = [point]
            self.trajectory_publishers[joint].publish(msg)
            rospy.loginfo(f'Published angle {angle} for {joint}')

def imu_callback(data, joint_name):
    """
    Callback function to process IMU data and store it in the measurements dictionary.
    """
    global measurements
    measurements[joint_name] = {
        'aX': data.linear_acceleration.x,
        'aY': data.linear_acceleration.y,
        'aZ': data.linear_acceleration.z,
        'vX': data.angular_velocity.x,
        'vY': data.angular_velocity.y,
        'vZ': data.angular_velocity.z,
    }
    # print('yr_l_ank_joint aZ',measurements['yr_l_ank_joint']['aZ'])

def call_compute_left_foot_position(joint_angles):
    rospy.wait_for_service('compute_left_foot_position')
    try:
        compute_left_foot_position = rospy.ServiceProxy('compute_left_foot_position', ComputeLeftFootPosition)
        resp = compute_left_foot_position(joint_angles)
        return resp.foot_position
    except rospy.ServiceException as e:
        print("Service call failed: %s" % e)

def call_compute_right_foot_position(joint_angles):
    rospy.wait_for_service('compute_right_foot_position')
    try:
        compute_right_foot_position = rospy.ServiceProxy('compute_right_foot_position', ComputeRightFootPosition)
        resp = compute_right_foot_position(joint_angles)
        return resp.foot_position
    except rospy.ServiceException as e:
        print("Service call failed: %s" % e)


def call_solve_ik_left_foot(x, y, z, roll, pitch, yaw):
    rospy.wait_for_service('solve_ik_left_foot')
    try:
        solve_ik = rospy.ServiceProxy('solve_ik_left_foot', SolveIKLeftFoot)
        resp = solve_ik(x, y, z, roll, pitch, yaw)
        return resp.joint_angles
    except rospy.ServiceException as e:
        print("Service call failed: %s" % e)

def call_solve_ik_right_foot(x, y, z, roll, pitch, yaw):
    rospy.wait_for_service('solve_ik_right_foot')
    try:
        solve_ik = rospy.ServiceProxy('solve_ik_right_foot', SolveIKRightFoot)
        resp = solve_ik(x, y, z, roll, pitch, yaw)
        return resp.joint_angles
    except rospy.ServiceException as e:
        print("Service call failed: %s" % e)


def encoder_callback(msg):
    global encoder_values
    encoder_values = dict(zip(msg.name, msg.position))


def model_eulers_callback(data):
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
        model_euler_angles['roll'] = euler[0]
        model_euler_angles['pitch'] = euler[1]
        model_euler_angles['yaw'] = euler[2]
        # rospy.loginfo("Euler angles of 'exo': roll: {:.2f}, pitch: {:.2f}, yaw: {:.2f}".format(euler[0], euler[1], euler[2]))
    except ValueError:
        rospy.logerr("Model 'exo' not found in the model states.")


def all_jacobians_callback(data):
    global jacobians_dict
    jacobians_dict.clear()
    for name, jacobian_matrix_msg in zip(data.names, data.jacobians):
        jacobian_np = np.array(jacobian_matrix_msg.data).reshape(jacobian_matrix_msg.rows, jacobian_matrix_msg.columns)
        jacobians_dict[name] = jacobian_np
    # print("Updated Jacobians Dictionary")


def setup_subscribers():
    # Set up the IMU subscribers for each joint.
    joints = ['yr_l_ank_joint', 'yr_l_hip_joint', 'yr_l_kne_joint', 'yr_l_pel_joint', 'yr_r_ank_joint', 'yr_r_hip_joint', 'yr_r_kne_joint', 'yr_r_pel_joint']
    for joint in joints:
        rospy.Subscriber(f'/{joint}/imu_data', Imu, imu_callback, joint)

    #Set up the Ecnoder subscriber
    rospy.Subscriber("/exo/joint_states", JointState, encoder_callback)

    #Set up the Euler angles subscriber
    rospy.Subscriber("/gazebo/model_states", ModelStates, model_eulers_callback)
    
    #Set up jacobians subscriber
    rospy.Subscriber('/exo/all_jacobians', AllJacobians, all_jacobians_callback)





if __name__ == "__main__":
    rospy.init_node('exo_controller_and_joint_state_manager', anonymous=True)
    manager = ExoControllerManager()
    rospy.sleep(2)  # Wait a bit for everything to initialize
    setup_subscribers()

    # Example usage for wanted_angles
    print('starting')
    PI = 3.14159265359
    # Example for offset correction of wanted_angles (same sign changing for torques as well)
    wanted_angles= [-0.2792526803191111, 0.5934119456781112, 0.3490658503988889, 0.08335134124337876, -0.2792526803191111, 0.5934119456781112, 0.3490658503988889, 0.08335134124337876]
    wanted_angles[1] = -wanted_angles[1] 
    wanted_angles[4] = -wanted_angles[4]
    wanted_angles[5] = -wanted_angles[5]
    # manager.set_angles({'yr_l_pel_joint': wanted_angles[0], 'yr_l_hip_joint': wanted_angles[1],'yr_l_kne_joint': wanted_angles[2], 'yr_l_ank_joint': wanted_angles[3],'yr_r_pel_joint': wanted_angles[4], 'yr_r_hip_joint': wanted_angles[5],'yr_r_kne_joint': wanted_angles[6], 'yr_r_ank_joint': wanted_angles[7]})
    print('ended')
    rospy.sleep(2)
    print(model_euler_angles)
    print(left_foot_pose)
    print(right_foot_pose)
    print(jacobians_dict)


    # Example usage for initial robot angle positions (it won't stand up if already fallen, these are just angle positions at which it stands)
    # print('starting')
    # PI = 3.14159265359
    manager.set_angles({'yr_l_pel_joint': -0.00023463788109292366, 'yr_l_hip_joint': -0.8396501900169805,'yr_l_kne_joint': 1.67926951839456, 'yr_l_ank_joint': -0.8395229808435698      ,'yr_r_pel_joint': 0.0, 'yr_r_hip_joint': -PI/4,'yr_r_kne_joint': PI/2, 'yr_r_ank_joint': -PI/4})
    # print('ended')                                                                                                

    left_leg_joint_angles = [0.0, -0.5, 1.0, -0.5]
    right_leg_joint_angles = [0.0, -0.5, 0.5, -0.5]                                                                         

    left_foot_position = call_compute_left_foot_position(left_leg_joint_angles)
    print("Left Foot Position:", left_foot_position)

    right_foot_position = call_compute_right_foot_position(right_leg_joint_angles)
    print("Right Foot Position:", right_foot_position)


    x, y, z = 0.1, 0.275, -0.7
    roll, pitch, yaw = 0.0, 0.0, 0.0
    left_foot_joint_angles = call_solve_ik_left_foot(x, y, z, roll, pitch, yaw)
    print("Left Foot Joint Angles:", left_foot_joint_angles)

    # Example target pose for the right foot
    x, y, z = 0.1, -0.275, -0.7
    roll, pitch, yaw = 0.0, 0.0, 0.0
    right_foot_joint_angles = call_solve_ik_right_foot(x, y, z, roll, pitch, yaw)
    print("Right Foot Joint Angles:", right_foot_joint_angles)

    #Sending torque commands only to pel and hip joint of right leg
    # manager.set_torques({'yr_l_pel_joint': -100.0, 'yr_l_hip_joint': 0.0})

    #Sending angle commands only to pel and hip joint of right leg
    # manager.set_torques({'yr_l_pel_joint': 0.0, 'yr_l_hip_joint': -PI/4})
    rospy.spin()
