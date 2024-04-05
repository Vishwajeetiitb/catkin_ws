#!/usr/bin/env python3
import rospy
import kdl_parser_py.urdf
from PyKDL import ChainFkSolverPos_recursive, JntArray, Vector, Frame, Rotation

def get_chain_from_kdl_tree(base_link, end_link):
    rospy.init_node('com_calculator')
    _, tree = kdl_parser_py.urdf.treeFromParam('robot_description')
    chain = tree.getChain(base_link, end_link)
    return chain

def compute_chain_com(chain, joint_positions):
    """
    Compute the CoM of a chain.
    Assumes joint_positions is a list of joint positions in the same order as the chain.
    """
    # Initialize the forward kinematics solver
    fk_solver = ChainFkSolverPos_recursive(chain)
    
    # Create a JntArray and fill it with the joint positions
    jnt_array = JntArray(len(joint_positions))
    for i, pos in enumerate(joint_positions):
        jnt_array[i] = pos

    total_mass = 0.0
    total_com = Vector(0, 0, 0)

    # Iterate through each segment to calculate its contribution to the total CoM
    for i in range(chain.getNrOfSegments()):
        segment = chain.getSegment(i)
        inertia = segment.getInertia()
        print(inertia)
        mass = inertia.getMass()

        # Calculate the frame (pose) of this segment's center of mass relative to the base link
        frame = Frame()
        if fk_solver.JntToCart(jnt_array, frame, i + 1) >= 0:
            # Assuming the mass is centered at the segment frame's origin
            com = frame.p * mass
            total_mass += mass
            total_com += com

    if total_mass > 0:
        # Compute the overall center of mass
        overall_com = total_com / total_mass
    else:
        raise ValueError("Total mass is zero, cannot compute CoM")

    return overall_com

if __name__ == "__main__":
    try:
        base_link = "l_pel_link"  # Adjust as needed
        end_link = "l_foot_bottom_link"  # Adjust as needed
        chain = get_chain_from_kdl_tree(base_link, end_link)
        # Dummy joint positions - replace with actual values
        joint_positions = [0.0 for _ in range(chain.getNrOfJoints())]
        overall_com = compute_chain_com(chain, joint_positions)
        print(f"Overall Center of Mass: {overall_com}")
    except Exception as e:
        print(f"Error: {e}")
