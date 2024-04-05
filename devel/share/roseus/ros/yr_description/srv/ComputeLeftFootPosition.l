;; Auto-generated. Do not edit!


(when (boundp 'yr_description::ComputeLeftFootPosition)
  (if (not (find-package "YR_DESCRIPTION"))
    (make-package "YR_DESCRIPTION"))
  (shadow 'ComputeLeftFootPosition (find-package "YR_DESCRIPTION")))
(unless (find-package "YR_DESCRIPTION::COMPUTELEFTFOOTPOSITION")
  (make-package "YR_DESCRIPTION::COMPUTELEFTFOOTPOSITION"))
(unless (find-package "YR_DESCRIPTION::COMPUTELEFTFOOTPOSITIONREQUEST")
  (make-package "YR_DESCRIPTION::COMPUTELEFTFOOTPOSITIONREQUEST"))
(unless (find-package "YR_DESCRIPTION::COMPUTELEFTFOOTPOSITIONRESPONSE")
  (make-package "YR_DESCRIPTION::COMPUTELEFTFOOTPOSITIONRESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass yr_description::ComputeLeftFootPositionRequest
  :super ros::object
  :slots (_joint_angles ))

(defmethod yr_description::ComputeLeftFootPositionRequest
  (:init
   (&key
    ((:joint_angles __joint_angles) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _joint_angles __joint_angles)
   self)
  (:joint_angles
   (&optional __joint_angles)
   (if __joint_angles (setq _joint_angles __joint_angles)) _joint_angles)
  (:serialization-length
   ()
   (+
    ;; float64[] _joint_angles
    (* 8    (length _joint_angles)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _joint_angles
     (write-long (length _joint_angles) s)
     (dotimes (i (length _joint_angles))
       (sys::poke (elt _joint_angles i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _joint_angles
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_angles (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _joint_angles i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass yr_description::ComputeLeftFootPositionResponse
  :super ros::object
  :slots (_foot_position ))

(defmethod yr_description::ComputeLeftFootPositionResponse
  (:init
   (&key
    ((:foot_position __foot_position) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _foot_position __foot_position)
   self)
  (:foot_position
   (&rest __foot_position)
   (if (keywordp (car __foot_position))
       (send* _foot_position __foot_position)
     (progn
       (if __foot_position (setq _foot_position (car __foot_position)))
       _foot_position)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _foot_position
    (send _foot_position :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _foot_position
       (send _foot_position :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _foot_position
     (send _foot_position :deserialize buf ptr-) (incf ptr- (send _foot_position :serialization-length))
   ;;
   self)
  )

(defclass yr_description::ComputeLeftFootPosition
  :super ros::object
  :slots ())

(setf (get yr_description::ComputeLeftFootPosition :md5sum-) "05815670e17c3341d3dc434a6547e3b1")
(setf (get yr_description::ComputeLeftFootPosition :datatype-) "yr_description/ComputeLeftFootPosition")
(setf (get yr_description::ComputeLeftFootPosition :request) yr_description::ComputeLeftFootPositionRequest)
(setf (get yr_description::ComputeLeftFootPosition :response) yr_description::ComputeLeftFootPositionResponse)

(defmethod yr_description::ComputeLeftFootPositionRequest
  (:response () (instance yr_description::ComputeLeftFootPositionResponse :init)))

(setf (get yr_description::ComputeLeftFootPositionRequest :md5sum-) "05815670e17c3341d3dc434a6547e3b1")
(setf (get yr_description::ComputeLeftFootPositionRequest :datatype-) "yr_description/ComputeLeftFootPositionRequest")
(setf (get yr_description::ComputeLeftFootPositionRequest :definition-)
      "# Request
float64[] joint_angles
---
# Response
geometry_msgs/Point foot_position


================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
")

(setf (get yr_description::ComputeLeftFootPositionResponse :md5sum-) "05815670e17c3341d3dc434a6547e3b1")
(setf (get yr_description::ComputeLeftFootPositionResponse :datatype-) "yr_description/ComputeLeftFootPositionResponse")
(setf (get yr_description::ComputeLeftFootPositionResponse :definition-)
      "# Request
float64[] joint_angles
---
# Response
geometry_msgs/Point foot_position


================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
")



(provide :yr_description/ComputeLeftFootPosition "05815670e17c3341d3dc434a6547e3b1")


