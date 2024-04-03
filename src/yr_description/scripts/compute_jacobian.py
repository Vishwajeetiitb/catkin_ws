#!/usr/bin/env python3
import rospy
from sensor_msgs.msg import JointState
from urdf_parser_py.urdf import URDF
from kdl_parser_py.urdf import treeFromUrdfModel
from PyKDL import ChainJntToJacSolver, JntArray
from yr_description.msg import AllJacobians, JacobianMatrix
import PyKDL


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
        rospy.Subscriber("/exo/joint_states", JointState, self.joint_states_callback)
        self.jacobian_publisher = rospy.Publisher('/exo/all_jacobians', AllJacobians, queue_size=10)


    def joint_states_callback(self, msg):
        # First, create a dictionary mapping joint names to their positions
        joint_name_to_position = {name: position for name, position in zip(msg.name, msg.position)}
        
        # Update the joint positions for each chain
        for link_name in self.end_effectors.keys():
            chain = self.chains[link_name]
            joint_positions = self.jnt_positions[link_name]
            
            # Iterate through each joint in the chain
            for i in range(chain.getNrOfJoints()):
                joint_name = chain.getSegment(i).getJoint().getName()
                if joint_name in joint_name_to_position:
                    # Update the joint position in the JntArray
                    joint_positions[i] = joint_name_to_position[joint_name]

        all_jacobians_msg = AllJacobians()
        all_jacobians_msg.names = list(self.end_effectors.keys())  # Assuming you want to keep the same order

        for link_name in self.end_effectors.keys():
            jacobian = self.compute_jacobian(link_name)
            flattened_jacobian = [jacobian[i, j] for i in range(jacobian.rows()) for j in range(jacobian.columns())]
            
            jacobian_matrix_msg = JacobianMatrix()
            jacobian_matrix_msg.data = flattened_jacobian
            jacobian_matrix_msg.rows = jacobian.rows()
            jacobian_matrix_msg.columns = jacobian.columns()
            all_jacobians_msg.jacobians.append(jacobian_matrix_msg)

        # Publish the aggregated Jacobians
        self.jacobian_publisher.publish(all_jacobians_msg)

    def compute_jacobian(self, link_name):
        jacobian = PyKDL.Jacobian(self.chains[link_name].getNrOfJoints())
        self.jac_solvers[link_name].JntToJac(self.jnt_positions[link_name], jacobian)
        return jacobian


if __name__ == "__main__":
    rospy.init_node('exoskeleton_jacobian_calculator')
    calculator = ExoskeletonJacobianCalculator()
    rospy.spin()
