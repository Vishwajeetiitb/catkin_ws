#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import JointState
from urdf_parser_py.urdf import URDF
from kdl_parser_py.urdf import treeFromUrdfModel
from PyKDL import ChainJntToJacSolver, JntArray

class ExoskeletonJacobianCalculator:
    def __init__(self):
        # Load URDF model of the robot from the parameter server
        self.robot = URDF.from_parameter_server()
        
        # Parse URDF to create a KDL tree
        _, self.tree = treeFromUrdfModel(self.robot)
        
        # Define the end-effector names for both legs
        self.end_effectors = {
            "l_pel": "l_pel_link",
            "l_thigh": "l_thigh_link",
            "l_shank": "l_shank_link",
            "l_foot": "l_foot_link",
            "r_pel": "r_pel_link",
            "r_thigh": "r_thigh_link",
            "r_shank": "r_shank_link",
            "r_foot": "r_foot_link"
        }
        
        # Initialize a dictionary to hold the chains, joint positions, and solvers for each link
        self.chains = {}
        self.jnt_positions = {}
        self.jac_solvers = {}

        # Create chains, joint arrays, and solvers for each specified link
        for link_name, end_effector in self.end_effectors.items():
            self.chains[link_name] = self.tree.getChain("waist_link", end_effector)
            self.jnt_positions[link_name] = JntArray(self.chains[link_name].getNrOfJoints())
            self.jac_solvers[link_name] = ChainJntToJacSolver(self.chains[link_name])
        
        # Subscribe to the joint states topic
        rospy.Subscriber("joint_states", JointState, self.joint_states_callback)

    def joint_states_callback(self, msg):
        # Update the joint positions for each chain
        for name, position in zip(msg.name, msg.position):
            # Update joint positions for all chains where this joint is part of the chain
            for link_name, chain in self.chains.items():
                try:
                    index = self.robot.joint_map[name].index
                    if index < chain.getNrOfJoints():
                        self.jnt_positions[link_name][index] = position
                except KeyError:
                    continue

        # Compute and print the Jacobian for each chain
        for link_name in self.end_effectors.keys():
            self.compute_and_print_jacobian(link_name)

    def compute_and_print_jacobian(self, link_name):
        jacobian = PyKDL.Jacobian(self.chains[link_name].getNrOfJoints())
        self.jac_solvers[link_name].JntToJac(self.jnt_positions[link_name], jacobian)
        print(f"Jacobian for {link_name}:")
        for i in range(jacobian.rows()):
            for j in range(jacobian.columns()):
                print(f"{jacobian[i, j]:.4f}", end=' ')
            print()
        print("\n")

if __name__ == "__main__":
    rospy.init_node('exoskeleton_jacobian_calculator')
    calculator = ExoskeletonJacobianCalculator()
    rospy.spin()
