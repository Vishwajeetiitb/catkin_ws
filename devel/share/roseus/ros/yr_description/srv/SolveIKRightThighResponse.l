;; Auto-generated. Do not edit!


(when (boundp 'yr_description::SolveIKRightThighResponse)
  (if (not (find-package "YR_DESCRIPTION"))
    (make-package "YR_DESCRIPTION"))
  (shadow 'SolveIKRightThighResponse (find-package "YR_DESCRIPTION")))
(unless (find-package "YR_DESCRIPTION::SOLVEIKRIGHTTHIGHRESPONSE")
  (make-package "YR_DESCRIPTION::SOLVEIKRIGHTTHIGHRESPONSE"))
(unless (find-package "YR_DESCRIPTION::SOLVEIKRIGHTTHIGHRESPONSEREQUEST")
  (make-package "YR_DESCRIPTION::SOLVEIKRIGHTTHIGHRESPONSEREQUEST"))
(unless (find-package "YR_DESCRIPTION::SOLVEIKRIGHTTHIGHRESPONSERESPONSE")
  (make-package "YR_DESCRIPTION::SOLVEIKRIGHTTHIGHRESPONSERESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass yr_description::SolveIKRightThighResponseRequest
  :super ros::object
  :slots (_joint_angles ))

(defmethod yr_description::SolveIKRightThighResponseRequest
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

(defclass yr_description::SolveIKRightThighResponseResponse
  :super ros::object
  :slots (_foot_position ))

(defmethod yr_description::SolveIKRightThighResponseResponse
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

(defclass yr_description::SolveIKRightThighResponse
  :super ros::object
  :slots ())

(setf (get yr_description::SolveIKRightThighResponse :md5sum-) "05815670e17c3341d3dc434a6547e3b1")
(setf (get yr_description::SolveIKRightThighResponse :datatype-) "yr_description/SolveIKRightThighResponse")
(setf (get yr_description::SolveIKRightThighResponse :request) yr_description::SolveIKRightThighResponseRequest)
(setf (get yr_description::SolveIKRightThighResponse :response) yr_description::SolveIKRightThighResponseResponse)

(defmethod yr_description::SolveIKRightThighResponseRequest
  (:response () (instance yr_description::SolveIKRightThighResponseResponse :init)))

(setf (get yr_description::SolveIKRightThighResponseRequest :md5sum-) "05815670e17c3341d3dc434a6547e3b1")
(setf (get yr_description::SolveIKRightThighResponseRequest :datatype-) "yr_description/SolveIKRightThighResponseRequest")
(setf (get yr_description::SolveIKRightThighResponseRequest :definition-)
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

(setf (get yr_description::SolveIKRightThighResponseResponse :md5sum-) "05815670e17c3341d3dc434a6547e3b1")
(setf (get yr_description::SolveIKRightThighResponseResponse :datatype-) "yr_description/SolveIKRightThighResponseResponse")
(setf (get yr_description::SolveIKRightThighResponseResponse :definition-)
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



(provide :yr_description/SolveIKRightThighResponse "05815670e17c3341d3dc434a6547e3b1")


