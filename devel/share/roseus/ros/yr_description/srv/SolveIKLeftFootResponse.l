;; Auto-generated. Do not edit!


(when (boundp 'yr_description::SolveIKLeftFootResponse)
  (if (not (find-package "YR_DESCRIPTION"))
    (make-package "YR_DESCRIPTION"))
  (shadow 'SolveIKLeftFootResponse (find-package "YR_DESCRIPTION")))
(unless (find-package "YR_DESCRIPTION::SOLVEIKLEFTFOOTRESPONSE")
  (make-package "YR_DESCRIPTION::SOLVEIKLEFTFOOTRESPONSE"))
(unless (find-package "YR_DESCRIPTION::SOLVEIKLEFTFOOTRESPONSEREQUEST")
  (make-package "YR_DESCRIPTION::SOLVEIKLEFTFOOTRESPONSEREQUEST"))
(unless (find-package "YR_DESCRIPTION::SOLVEIKLEFTFOOTRESPONSERESPONSE")
  (make-package "YR_DESCRIPTION::SOLVEIKLEFTFOOTRESPONSERESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass yr_description::SolveIKLeftFootResponseRequest
  :super ros::object
  :slots (_joint_angles ))

(defmethod yr_description::SolveIKLeftFootResponseRequest
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

(defclass yr_description::SolveIKLeftFootResponseResponse
  :super ros::object
  :slots (_foot_position ))

(defmethod yr_description::SolveIKLeftFootResponseResponse
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

(defclass yr_description::SolveIKLeftFootResponse
  :super ros::object
  :slots ())

(setf (get yr_description::SolveIKLeftFootResponse :md5sum-) "05815670e17c3341d3dc434a6547e3b1")
(setf (get yr_description::SolveIKLeftFootResponse :datatype-) "yr_description/SolveIKLeftFootResponse")
(setf (get yr_description::SolveIKLeftFootResponse :request) yr_description::SolveIKLeftFootResponseRequest)
(setf (get yr_description::SolveIKLeftFootResponse :response) yr_description::SolveIKLeftFootResponseResponse)

(defmethod yr_description::SolveIKLeftFootResponseRequest
  (:response () (instance yr_description::SolveIKLeftFootResponseResponse :init)))

(setf (get yr_description::SolveIKLeftFootResponseRequest :md5sum-) "05815670e17c3341d3dc434a6547e3b1")
(setf (get yr_description::SolveIKLeftFootResponseRequest :datatype-) "yr_description/SolveIKLeftFootResponseRequest")
(setf (get yr_description::SolveIKLeftFootResponseRequest :definition-)
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

(setf (get yr_description::SolveIKLeftFootResponseResponse :md5sum-) "05815670e17c3341d3dc434a6547e3b1")
(setf (get yr_description::SolveIKLeftFootResponseResponse :datatype-) "yr_description/SolveIKLeftFootResponseResponse")
(setf (get yr_description::SolveIKLeftFootResponseResponse :definition-)
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



(provide :yr_description/SolveIKLeftFootResponse "05815670e17c3341d3dc434a6547e3b1")


