;; Auto-generated. Do not edit!


(when (boundp 'yr_description::SolveIKLeftThighResponse)
  (if (not (find-package "YR_DESCRIPTION"))
    (make-package "YR_DESCRIPTION"))
  (shadow 'SolveIKLeftThighResponse (find-package "YR_DESCRIPTION")))
(unless (find-package "YR_DESCRIPTION::SOLVEIKLEFTTHIGHRESPONSE")
  (make-package "YR_DESCRIPTION::SOLVEIKLEFTTHIGHRESPONSE"))
(unless (find-package "YR_DESCRIPTION::SOLVEIKLEFTTHIGHRESPONSEREQUEST")
  (make-package "YR_DESCRIPTION::SOLVEIKLEFTTHIGHRESPONSEREQUEST"))
(unless (find-package "YR_DESCRIPTION::SOLVEIKLEFTTHIGHRESPONSERESPONSE")
  (make-package "YR_DESCRIPTION::SOLVEIKLEFTTHIGHRESPONSERESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass yr_description::SolveIKLeftThighResponseRequest
  :super ros::object
  :slots (_joint_angles ))

(defmethod yr_description::SolveIKLeftThighResponseRequest
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

(defclass yr_description::SolveIKLeftThighResponseResponse
  :super ros::object
  :slots (_foot_position ))

(defmethod yr_description::SolveIKLeftThighResponseResponse
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

(defclass yr_description::SolveIKLeftThighResponse
  :super ros::object
  :slots ())

(setf (get yr_description::SolveIKLeftThighResponse :md5sum-) "05815670e17c3341d3dc434a6547e3b1")
(setf (get yr_description::SolveIKLeftThighResponse :datatype-) "yr_description/SolveIKLeftThighResponse")
(setf (get yr_description::SolveIKLeftThighResponse :request) yr_description::SolveIKLeftThighResponseRequest)
(setf (get yr_description::SolveIKLeftThighResponse :response) yr_description::SolveIKLeftThighResponseResponse)

(defmethod yr_description::SolveIKLeftThighResponseRequest
  (:response () (instance yr_description::SolveIKLeftThighResponseResponse :init)))

(setf (get yr_description::SolveIKLeftThighResponseRequest :md5sum-) "05815670e17c3341d3dc434a6547e3b1")
(setf (get yr_description::SolveIKLeftThighResponseRequest :datatype-) "yr_description/SolveIKLeftThighResponseRequest")
(setf (get yr_description::SolveIKLeftThighResponseRequest :definition-)
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

(setf (get yr_description::SolveIKLeftThighResponseResponse :md5sum-) "05815670e17c3341d3dc434a6547e3b1")
(setf (get yr_description::SolveIKLeftThighResponseResponse :datatype-) "yr_description/SolveIKLeftThighResponseResponse")
(setf (get yr_description::SolveIKLeftThighResponseResponse :definition-)
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



(provide :yr_description/SolveIKLeftThighResponse "05815670e17c3341d3dc434a6547e3b1")


