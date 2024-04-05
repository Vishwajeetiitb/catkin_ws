;; Auto-generated. Do not edit!


(when (boundp 'yr_description::IKLeft)
  (if (not (find-package "YR_DESCRIPTION"))
    (make-package "YR_DESCRIPTION"))
  (shadow 'IKLeft (find-package "YR_DESCRIPTION")))
(unless (find-package "YR_DESCRIPTION::IKLEFT")
  (make-package "YR_DESCRIPTION::IKLEFT"))
(unless (find-package "YR_DESCRIPTION::IKLEFTREQUEST")
  (make-package "YR_DESCRIPTION::IKLEFTREQUEST"))
(unless (find-package "YR_DESCRIPTION::IKLEFTRESPONSE")
  (make-package "YR_DESCRIPTION::IKLEFTRESPONSE"))

(in-package "ROS")





(defclass yr_description::IKLeftRequest
  :super ros::object
  :slots (_x _y _z _roll _pitch _yaw ))

(defmethod yr_description::IKLeftRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; float64 _roll
    8
    ;; float64 _pitch
    8
    ;; float64 _yaw
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _roll
     (setq _roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitch
     (setq _pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass yr_description::IKLeftResponse
  :super ros::object
  :slots (_joint_angles ))

(defmethod yr_description::IKLeftResponse
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

(defclass yr_description::IKLeft
  :super ros::object
  :slots ())

(setf (get yr_description::IKLeft :md5sum-) "2d3149f50ac2299a08916bb78e0c6b8d")
(setf (get yr_description::IKLeft :datatype-) "yr_description/IKLeft")
(setf (get yr_description::IKLeft :request) yr_description::IKLeftRequest)
(setf (get yr_description::IKLeft :response) yr_description::IKLeftResponse)

(defmethod yr_description::IKLeftRequest
  (:response () (instance yr_description::IKLeftResponse :init)))

(setf (get yr_description::IKLeftRequest :md5sum-) "2d3149f50ac2299a08916bb78e0c6b8d")
(setf (get yr_description::IKLeftRequest :datatype-) "yr_description/IKLeftRequest")
(setf (get yr_description::IKLeftRequest :definition-)
      "# Request
float64 x
float64 y
float64 z
float64 roll
float64 pitch
float64 yaw
---
# Response
float64[] joint_angles
")

(setf (get yr_description::IKLeftResponse :md5sum-) "2d3149f50ac2299a08916bb78e0c6b8d")
(setf (get yr_description::IKLeftResponse :datatype-) "yr_description/IKLeftResponse")
(setf (get yr_description::IKLeftResponse :definition-)
      "# Request
float64 x
float64 y
float64 z
float64 roll
float64 pitch
float64 yaw
---
# Response
float64[] joint_angles
")



(provide :yr_description/IKLeft "2d3149f50ac2299a08916bb78e0c6b8d")


