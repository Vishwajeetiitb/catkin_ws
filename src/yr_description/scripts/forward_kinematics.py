#!/usr/bin/env python3
import rospy
import PyKDL
from kdl_parser_py.urdf import treeFromParam
from sensor_msgs.msg import JointState
from yr_description.msg import FeetPositions
import geometry_msgs


class ForwardKinematicsCalculator:
    def __init__(self):
        rospy.init_node('forward_kinematics_calculator')

        # Load the robot's tree from the 'robot_description' parameter
        self.robot_tree = PyKDL.Tree()
        result, self.robot_tree = treeFromParam('robot_description')
        if not result:
            rospy.logerr("Failed to extract kdl tree from robot description")
            return

        # Create chains for both legs based on your robot's specific links
        self.left_leg_chain = self.robot_tree.getChain("waist_link", "l_foot_link")
        self.right_leg_chain = self.robot_tree.getChain("waist_link", "r_foot_link")

        # Initialize joint position arrays
        self.left_leg_joints = PyKDL.JntArray(self.left_leg_chain.getNrOfJoints())
        self.right_leg_joints = PyKDL.JntArray(self.right_leg_chain.getNrOfJoints())

        # Manually map joint names to their indices for both legs
        self.left_leg_joints_indices = {
            'yr_l_pel_joint': 0,
            'yr_l_hip_joint': 1,
            'yr_l_kne_joint': 2,
            'yr_l_ank_joint': 3,
        }

        self.right_leg_joints_indices = {
            'yr_r_pel_joint': 0,
            'yr_r_hip_joint': 1,
            'yr_r_kne_joint': 2,
            'yr_r_ank_joint': 3,
        }


        # Subscribe to joint states
        rospy.Subscriber("exo/joint_states", JointState, self.joint_states_callback)

        # Foot positions Publisher
        self.feet_pos_pub = rospy.Publisher("/exo/feet_positions", FeetPositions, queue_size=10)


    def joint_states_callback(self, msg):
        # Update joint positions based on the message
        for name, position in zip(msg.name, msg.position):
            if name in self.left_leg_joints_indices:
                index = self.left_leg_joints_indices[name]
                self.left_leg_joints[index] = position
            elif name in self.right_leg_joints_indices:
                index = self.right_leg_joints_indices[name]
                self.right_leg_joints[index] = position

        # Compute and print the positions of both feet
        left_foot_position = self.get_foot_position(self.left_leg_chain, self.left_leg_joints)
        right_foot_position = self.get_foot_position(self.right_leg_chain, self.right_leg_joints)

        feet_positions_msg = FeetPositions()
        feet_positions_msg.left_foot = left_foot_position
        feet_positions_msg.right_foot = right_foot_position

        self.feet_pos_pub.publish(feet_positions_msg)
        

    def get_foot_position(self, chain, joint_positions):
        fk_solver = PyKDL.ChainFkSolverPos_recursive(chain)
        end_frame = PyKDL.Frame()
        fk_solver.JntToCart(joint_positions, end_frame)

        foot_h = 0.1  # assuming you want to use the same offset for both feet
        offset_frame = PyKDL.Frame(PyKDL.Rotation.Identity(), PyKDL.Vector(0, 0, -foot_h))
        transformed_frame = end_frame * offset_frame

        position_msg = geometry_msgs.msg.Point()
        position_msg.x = transformed_frame.p[0]
        position_msg.y = transformed_frame.p[1]
        position_msg.z = transformed_frame.p[2]

        return position_msg



if __name__ == '__main__':
    calculator = ForwardKinematicsCalculator()
    rospy.spin()
