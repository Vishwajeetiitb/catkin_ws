#!/usr/bin/env python

import rospy
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint

def publish_trajectory(pub,joint_name, positions, duration=2.0):
    """
    Publishes a trajectory message for a single joint using its controller.

    :param joint_name: The name of the joint to control.
    :param positions: A list of positions for the joint trajectory.
    :param duration: Time from the start of the trajectory to reach the position.
    """
    

    # Create the trajectory message
    trajectory = JointTrajectory()
    trajectory.joint_names = [joint_name]
    point = JointTrajectoryPoint()
    point.positions = positions
    point.time_from_start = rospy.Duration(duration)
    trajectory.points.append(point)

    # Publish the trajectory message
    pub.publish(trajectory)
    rospy.loginfo('Published trajectory for {}'.format(joint_name))

def main():
    rospy.init_node('publish_joint_trajectories')

    # Define joints and their desired positions
    joint_positions = {
        'yr_l_pel_joint': [0.0],
        'yr_l_hip_joint': [0.0],
        'yr_l_kne_joint': [0.5],
        'yr_l_ank_joint': [0.5],
        'yr_r_pel_joint': [0.5],
        'yr_r_hip_joint': [0.5],
        'yr_r_kne_joint': [0.5],
        'yr_r_ank_joint': [0.5],
    }

    # Publish a trajectory for each joint
    # Create the trajectory publisher for the joint
    pub = rospy.Publisher('/exo/{}_trajectory_controller/command'.format(joint_name), JointTrajectory, queue_size=10)
    
    # Wait for the connection to establish
    rospy.sleep(1)
    for joint_name, positions in joint_positions.items():
        publish_trajectory(pub,joint_name, positions)

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
