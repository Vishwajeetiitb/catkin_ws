#! /usr/bin/env python
from __future__ import division
import rospy

import cv2
from std_msgs.msg import Float64
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
bridge = CvBridge()
rospy.init_node("move_bot")
kp = 6

def detect(msg):
    img = bridge.imgmsg_to_cv2(msg, "bgr8")
    
    w = img.shape[1]
    h = img.shape[0]
    d = img
    img = img[600:800,0:800]
    hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
#defining the range of Yellow color
    yellow_lower = np.array([20, 100, 100],np.uint8)
    yellow_upper = np.array([30, 255, 255],np.uint8)

#finding the range yellow colour in the image
    yellow = cv2.inRange(hsv, yellow_lower, yellow_upper)

        #Morphological transformation, Dilation         
    kernal = np.ones((5 ,5), "uint8")

    blue=cv2.dilate(yellow, kernal)
    # print(img.shape)
    res=cv2.bitwise_and(img, img, mask = yellow)
    #Tracking Colour (Yellow) 
    (_,contours,hierarchy)=cv2.findContours(yellow,cv2.RETR_TREE,cv2.CHAIN_APPROX_SIMPLE)
        
    for pic, contour in enumerate(contours):
            area = cv2.contourArea(contour)
            if(area>20):
                        
                    x,y,w,h = cv2.boundingRect(contour)     
                    img = cv2.rectangle(img,(x,y),(x+w,y+h),(255,0,0),3)
                    M = cv2.moments(contour)
                    cX = int(M["m10"] / M["m00"])
                    cY = int(M["m01"] / M["m00"])
                    cv2.circle(img, (cX, cY), 7, (255, 255, 255), -1)
                    cv2.circle(d, (cX, cY), 7, (255, 255, 255), -1)

                    error = float((cX-400)/800)
                    pid = kp*error
                    print(error)
                    left.data = -5 - pid	
                    right.data= -5 + pid


            else:
                left.data = 10
                right.data= -10


    if contours==[]:
        left.data = 3
        right.data= -3     
    cv2.imshow("C Tracking",d)
    cv2.imshow("Color Tracking",img)
    img = cv2.flip(img,1)
    cv2.imshow("Yellow",res)
    left_pub.publish(left)
    right_pub.publish(right)
    # print()                         
    if cv2.waitKey(10) & 0xFF == 27:
            cap.release()
            cv2.destroyAllWindows()

left =Float64()
right=Float64()
left.data = 1
right.data= -1

left_pub = rospy.Publisher("/rrbot/joint2_position_controller/command",Float64,queue_size =3 )
right_pub = rospy.Publisher("/rrbot/joint1_position_controller/command",Float64,queue_size =3 )

sub = rospy.Subscriber("/rrbot/camera1/image_raw",Image,detect)
rospy.spin()
