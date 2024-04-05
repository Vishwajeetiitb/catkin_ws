#!/usr/bin/env python3
import rospy
import PyKDL
from kdl_parser_py.urdf import treeFromParam
from yr_description.srv import IKLeft, IKLeftResponse
from yr_description.srv import IKRight, IKRightResponse 


class IKSolver:
    def __init__(self):
        rospy.init_node('ik_solver_service')
        _, self.tree = treeFromParam('robot_description')
        self.left_leg_chain = self.tree.getChain("waist_link", "l_foot_bottom_link")
        self.right_leg_chain = self.tree.getChain("waist_link", "r_foot_bottom_link")
        self.left_leg_ik_solver = PyKDL.ChainIkSolverPos_LMA(self.left_leg_chain)
        self.right_leg_ik_solver = PyKDL.ChainIkSolverPos_LMA(self.right_leg_chain)

        rospy.Service('solve_ik_left_foot', IKLeft, self.handle_solve_ik_left_foot)
        rospy.Service('solve_ik_right_foot', IKRight, self.handle_solve_ik_right_foot)
        rospy.loginfo("IK Solver Services for left and right foot are ready.")

    def create_target_frame(self, x, y, z, roll, pitch, yaw):
        return PyKDL.Frame(PyKDL.Rotation.RPY(roll, pitch, yaw), PyKDL.Vector(x, y, z))

    def solve_ik(self, chain, ik_solver, x, y, z, roll, pitch, yaw):
        target_frame = self.create_target_frame(x, y, z, roll, pitch, yaw)
        q_init = PyKDL.JntArray(chain.getNrOfJoints())
        q_sol = PyKDL.JntArray(chain.getNrOfJoints())
        if ik_solver.CartToJnt(q_init, target_frame, q_sol) >= 0:
            return [q_sol[i] for i in range(q_sol.rows())]
        else:
            rospy.logwarn("IK solver failed to find a solution.")
            return None

    def handle_solve_ik_left_foot(self, req):
        solution = self.solve_ik(
            self.left_leg_chain, self.left_leg_ik_solver, req.x, req.y, req.z, req.roll, req.pitch, req.yaw)
        
        return IKLeftResponse(joint_angles=solution)

    def handle_solve_ik_right_foot(self, req):
        solution = self.solve_ik(
            self.right_leg_chain, self.right_leg_ik_solver, req.x, req.y, req.z, req.roll, req.pitch, req.yaw)
        print(solution)
        return IKRightResponse(joint_angles=solution)

if __name__ == '__main__':
    solver = IKSolver()
    rospy.spin()
