;; Auto-generated. Do not edit!


(when (boundp 'yr_description::FeetPositions)
  (if (not (find-package "YR_DESCRIPTION"))
    (make-package "YR_DESCRIPTION"))
  (shadow 'FeetPositions (find-package "YR_DESCRIPTION")))
(unless (find-package "YR_DESCRIPTION::FEETPOSITIONS")
  (make-package "YR_DESCRIPTION::FEETPOSITIONS"))

(in-package "ROS")
;;//! \htmlinclude FeetPositions.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass yr_description::FeetPositions
  :super ros::object
  :slots (_left_foot _right_foot ))

(defmethod yr_description::FeetPositions
  (:init
   (&key
    ((:left_foot __left_foot) (instance geometry_msgs::Point :init))
    ((:right_foot __right_foot) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _left_foot __left_foot)
   (setq _right_foot __right_foot)
   self)
  (:left_foot
   (&rest __left_foot)
   (if (keywordp (car __left_foot))
       (send* _left_foot __left_foot)
     (progn
       (if __left_foot (setq _left_foot (car __left_foot)))
       _left_foot)))
  (:right_foot
   (&rest __right_foot)
   (if (keywordp (car __right_foot))
       (send* _right_foot __right_foot)
     (progn
       (if __right_foot (setq _right_foot (car __right_foot)))
       _right_foot)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _left_foot
    (send _left_foot :serialization-length)
    ;; geometry_msgs/Point _right_foot
    (send _right_foot :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _left_foot
       (send _left_foot :serialize s)
     ;; geometry_msgs/Point _right_foot
       (send _right_foot :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _left_foot
     (send _left_foot :deserialize buf ptr-) (incf ptr- (send _left_foot :serialization-length))
   ;; geometry_msgs/Point _right_foot
     (send _right_foot :deserialize buf ptr-) (incf ptr- (send _right_foot :serialization-length))
   ;;
   self)
  )

(setf (get yr_description::FeetPositions :md5sum-) "d71882dfd7fa607b1ca2fb34f4c223ba")
(setf (get yr_description::FeetPositions :datatype-) "yr_description/FeetPositions")
(setf (get yr_description::FeetPositions :definition-)
      "geometry_msgs/Point left_foot
geometry_msgs/Point right_foot
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :yr_description/FeetPositions "d71882dfd7fa607b1ca2fb34f4c223ba")


