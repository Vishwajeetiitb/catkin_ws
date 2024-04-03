;; Auto-generated. Do not edit!


(when (boundp 'stairs_detection::stair_info)
  (if (not (find-package "STAIRS_DETECTION"))
    (make-package "STAIRS_DETECTION"))
  (shadow 'stair_info (find-package "STAIRS_DETECTION")))
(unless (find-package "STAIRS_DETECTION::STAIR_INFO")
  (make-package "STAIRS_DETECTION::STAIR_INFO"))

(in-package "ROS")
;;//! \htmlinclude stair_info.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass stairs_detection::stair_info
  :super ros::object
  :slots (_pose _step_width _step_height _step_length _is_ascent ))

(defmethod stairs_detection::stair_info
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::PoseStamped :init))
    ((:step_width __step_width) 0.0)
    ((:step_height __step_height) 0.0)
    ((:step_length __step_length) 0.0)
    ((:is_ascent __is_ascent) nil)
    )
   (send-super :init)
   (setq _pose __pose)
   (setq _step_width (float __step_width))
   (setq _step_height (float __step_height))
   (setq _step_length (float __step_length))
   (setq _is_ascent __is_ascent)
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:step_width
   (&optional __step_width)
   (if __step_width (setq _step_width __step_width)) _step_width)
  (:step_height
   (&optional __step_height)
   (if __step_height (setq _step_height __step_height)) _step_height)
  (:step_length
   (&optional __step_length)
   (if __step_length (setq _step_length __step_length)) _step_length)
  (:is_ascent
   (&optional (__is_ascent :null))
   (if (not (eq __is_ascent :null)) (setq _is_ascent __is_ascent)) _is_ascent)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/PoseStamped _pose
    (send _pose :serialization-length)
    ;; float64 _step_width
    8
    ;; float64 _step_height
    8
    ;; float64 _step_length
    8
    ;; bool _is_ascent
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/PoseStamped _pose
       (send _pose :serialize s)
     ;; float64 _step_width
       (sys::poke _step_width (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _step_height
       (sys::poke _step_height (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _step_length
       (sys::poke _step_length (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _is_ascent
       (if _is_ascent (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/PoseStamped _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; float64 _step_width
     (setq _step_width (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _step_height
     (setq _step_height (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _step_length
     (setq _step_length (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _is_ascent
     (setq _is_ascent (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get stairs_detection::stair_info :md5sum-) "51b1f35e0c993fc5f498ebf9309e69d5")
(setf (get stairs_detection::stair_info :datatype-) "stairs_detection/stair_info")
(setf (get stairs_detection::stair_info :definition-)
      "# StairStep.msg
geometry_msgs/PoseStamped pose
float64 step_width
float64 step_height
float64 step_length
bool is_ascent

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :stairs_detection/stair_info "51b1f35e0c993fc5f498ebf9309e69d5")


