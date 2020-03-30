#! /usr/bin/env python

import rospy
from std_msgs.msg import Int32
from nav_msgs.msg import Odometry
from PIL import Image
from sensor_msgs.msg import Image
def callback(msg):
	Image.open(msg).show()

rospy.init_node('sub_node')
sub = rospy.Subscriber('/camera/rgb/image_raw',	Image,callback)
rospy.spin()

