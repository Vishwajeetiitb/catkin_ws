#!/usr/bin/env python

import rospy
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint
from control_msgs.msg import FollowJointTrajectoryFeedback
import time

def set_angles(data):
    trajectory = JointTrajectory()
    trajectory.joint_names = [
        'yr_l_pel_joint', 'yr_l_hip_joint', 'yr_l_kne_joint', 'yr_l_ank_joint',
        'yr_r_pel_joint', 'yr_r_hip_joint', 'yr_r_kne_joint', 'yr_r_ank_joint'
    ]
    
    
    point = JointTrajectoryPoint()
    point.positions = data
    point.velocities = [0.0 for _ in trajectory.joint_names]
    point.accelerations = [0.0 for _ in trajectory.joint_names]
    point.effort = [0.0 for _ in trajectory.joint_names]
    point.time_from_start = rospy.Duration(2)
    
    trajectory.points.append(point)
    return trajectory

def controller_state_callback(msg):
    global measurements
    measurements = msg.actual.positions
    #print(measurements)

def main():
    rospy.init_node('send_and_listen_joint_trajectory')

    # Subscriber to the controller state
    rospy.Subscriber("/exo/yr_trajectory_controller/state", FollowJointTrajectoryFeedback, controller_state_callback)

    # Publisher to the trajectory controller
    pub = rospy.Publisher('/exo/yr_trajectory_controller/command', JointTrajectory, queue_size=10)

    rospy.sleep(1)  # Wait for the connection to establish
    pi = 3.14159265359
    data = [-pi/2, -pi/4, pi/2, -pi/4, pi/2, -pi/4, pi/2, -pi/4]
    print('1st sequence:')
    trajectory_msg = set_angles(data=data)
    time.sleep(4)
    print('2nd sequence:')
    data = [-pi/2, -pi/4, pi/8, -pi/4, pi/2, -pi/4, pi/2, -pi/4]
    time.sleep(4)
    trajectory_msg = set_angles(data=data)
    # Publish the trajectory message
    pub.publish(trajectory_msg)
    rospy.loginfo('Trajectory sent!')

    # Keep the node running so it can listen to incoming messages on the controller state topic.
    rospy.spin()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException as e:
        print("Node interrupted before completion:", e)
