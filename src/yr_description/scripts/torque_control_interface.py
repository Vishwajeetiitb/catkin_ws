#!/usr/bin/env python

import rospy
from std_msgs.msg import Float64

class JointTorquePublisher:
    def __init__(self):
        # Initialize the ROS node
        rospy.init_node('joint_torque_publisher')

        # Dictionary to hold the publishers for each joint controller
        self.publishers = {}
        joint_names = [
            'yr_l_pel_joint', 'yr_l_hip_joint', 'yr_l_kne_joint', 'yr_l_ank_joint',
            'yr_r_pel_joint', 'yr_r_hip_joint', 'yr_r_kne_joint', 'yr_r_ank_joint'
        ]

        # Create a publisher for each joint effort controller
        for joint_name in joint_names:
            topic_name = f'/exo/{joint_name}_torque_controller/command'
            pub = rospy.Publisher(topic_name, Float64, queue_size=10)
            self.publishers[joint_name] = pub

        # Allow some time for the publishers to establish connections
        rospy.sleep(1)

    def publish_torques(self, joint_torques):
        """
        Publishes a torque value for all specified joints.

        :param joint_torques: Dictionary of joint names and their desired torque values.
        """
        for joint_name, torque in joint_torques.items():
            # Create the torque message
            torque_msg = Float64()
            torque_msg.data = torque

            # Publish the torque message for the joint
            self.publishers[joint_name].publish(torque_msg)
            rospy.loginfo(f'Published torque {torque} for {joint_name}')

def main():
    # Create an instance of the JointTorquePublisher
    torque_publisher = JointTorquePublisher()

    # Example: Publish a torque value to move all joints
    joint_torques = {
        'yr_l_pel_joint': 100.0,
        'yr_l_hip_joint': 1.0,
        'yr_l_kne_joint': 1.0,
        'yr_l_ank_joint': 1.0,
        'yr_r_pel_joint': 1.0,
        'yr_r_hip_joint': 1.0,
        'yr_r_kne_joint': 1.0,
        'yr_r_ank_joint': 1.0
    }

    torque_publisher.publish_torques(joint_torques)

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
