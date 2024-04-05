#!/usr/bin/env python3
import rospy
from kdl_parser_py.urdf import treeFromParam
from PyKDL import ChainFkSolverPos_recursive, Frame, JntArray
from geometry_msgs.msg import Point
from yr_description.srv import ComputeLeftFootPosition, ComputeLeftFootPositionResponse
from yr_description.srv import ComputeRightFootPosition, ComputeRightFootPositionResponse

class ForwardKinematicsCalculator:
    def __init__(self):
        rospy.init_node('forward_kinematics_calculator')

        # Load the robot's tree from the 'robot_description' parameter
        result, robot_tree = treeFromParam('robot_description')
        if not result:
            rospy.logerr("Failed to extract kdl tree from robot description")
            return

        # Create chains for both legs
        self.left_leg_chain = robot_tree.getChain("waist_link", "l_foot_bottom_link")
        self.right_leg_chain = robot_tree.getChain("waist_link", "r_foot_bottom_link")
        self.left_hip_chain = robot_tree.getChain("waist_link", "l_hip_link")
        self.right_hip_chain = robot_tree.getChain("waist_link", "r_hip_link")

        # Initialize service servers
        self.service_servers()

    def compute_foot_position(self, chain, joint_angles):
        joint_positions = JntArray(len(joint_angles))
        for i, angle in enumerate(joint_angles):
            joint_positions[i] = angle
        fk_solver = ChainFkSolverPos_recursive(chain)
        end_frame = Frame()
        fk_solver.JntToCart(joint_positions, end_frame)
        return end_frame.p

    def handle_compute_left_foot_position(self, req):
        foot_position = self.compute_foot_position(self.left_leg_chain, req.joint_angles)
        return ComputeLeftFootPositionResponse(foot_position=Point(x=foot_position[0], y=foot_position[1], z=foot_position[2]))

    def handle_compute_right_foot_position(self, req):
        foot_position = self.compute_foot_position(self.right_leg_chain, req.joint_angles)
        return ComputeRightFootPositionResponse(foot_position=Point(x=foot_position[0], y=foot_position[1], z=foot_position[2]))
    
    def handle_compute_left_hip_position(self, req):
        foot_position = self.compute_foot_position(self.left_hip_chain, req.joint_angles)
        return ComputeLeftFootPositionResponse(foot_position=Point(x=foot_position[0], y=foot_position[1], z=foot_position[2]))

    def handle_compute_right_hip_position(self, req):
        foot_position = self.compute_foot_position(self.right_hip_chain, req.joint_angles)
        return ComputeRightFootPositionResponse(foot_position=Point(x=foot_position[0], y=foot_position[1], z=foot_position[2]))

    def service_servers(self):
        rospy.Service('compute_left_foot_position', ComputeLeftFootPosition, self.handle_compute_left_foot_position)
        rospy.Service('compute_right_foot_position', ComputeRightFootPosition, self.handle_compute_right_foot_position)
        rospy.Service('compute_left_hip_position', ComputeLeftFootPosition, self.handle_compute_left_hip_position)
        rospy.Service('compute_right_hip_position', ComputeRightFootPosition, self.handle_compute_right_hip_position)
        rospy.loginfo("Forward kinematics services for left and right feet are ready.")

if __name__ == '__main__':
    fk_calculator = ForwardKinematicsCalculator()
    rospy.spin()
