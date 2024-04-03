#!/usr/bin/env python3
import sys
import rospy
import moveit_commander
import geometry_msgs.msg

def main():
    moveit_commander.roscpp_initialize(sys.argv)
    rospy.init_node('set_pose_goal_example', anonymous=True)

    # Replace 'your_robot_arm' with the name of your Move Group
    group_name = "right_leg_v1"
    move_group = moveit_commander.MoveGroupCommander(group_name)

    # Define the pose goal
    pose_goal = geometry_msgs.msg.Pose()
    pose_goal.orientation.w = 1.0
    pose_goal.position.x = 0.1  # Change these values to your desired pose
    pose_goal.position.y = -0.275
    pose_goal.position.z = -0.4

    # Set the pose target
    move_group.set_pose_target(pose_goal)

    # Execute the motion
    plan = move_group.go(wait=True)
    move_group.stop()  # Ensure there's no residual movement
    move_group.clear_pose_targets()  # Clear targets after planning

    # For a clean shutdown
    moveit_commander.roscpp_shutdown()

if __name__ == '__main__':
    main()
