#!/usr/bin/env python

import rospy
from std_msgs.msg import Float64
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint
from controller_manager_msgs.srv import SwitchController

class ExoControllerManager:
    def __init__(self):
        rospy.init_node('exo_controller_manager')

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
            point = JointTrajectoryPoint(positions=[angle], time_from_start=rospy.Duration(1))
            msg.points = [point]
            self.trajectory_publishers[joint].publish(msg)
            rospy.loginfo(f'Published angle {angle} for {joint}')

if __name__ == "__main__":
    manager = ExoControllerManager()
    rospy.sleep(2)  # Wait a bit for everything to initialize

    # Example usage
    print('starting')
    manager.set_angles({'yr_l_pel_joint': -1.575, 'yr_l_hip_joint': -0.7,'yr_l_kne_joint': 2.5, 'yr_l_ank_joint': -0.7,'yr_r_pel_joint': 1.575, 'yr_r_hip_joint': -0.7,'yr_r_kne_joint': 1.5, 'yr_r_ank_joint': -0.7})
    print('ended')
    rospy.sleep(5)
    manager.set_torques({'yr_l_pel_joint': -100.0})
    rospy.sleep(5)
