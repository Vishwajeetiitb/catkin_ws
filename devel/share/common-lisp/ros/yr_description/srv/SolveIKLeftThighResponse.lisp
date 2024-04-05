; Auto-generated. Do not edit!


(cl:in-package yr_description-srv)


;//! \htmlinclude SolveIKLeftThighResponse-request.msg.html

(cl:defclass <SolveIKLeftThighResponse-request> (roslisp-msg-protocol:ros-message)
  ((joint_angles
    :reader joint_angles
    :initarg :joint_angles
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass SolveIKLeftThighResponse-request (<SolveIKLeftThighResponse-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SolveIKLeftThighResponse-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SolveIKLeftThighResponse-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yr_description-srv:<SolveIKLeftThighResponse-request> is deprecated: use yr_description-srv:SolveIKLeftThighResponse-request instead.")))

(cl:ensure-generic-function 'joint_angles-val :lambda-list '(m))
(cl:defmethod joint_angles-val ((m <SolveIKLeftThighResponse-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yr_description-srv:joint_angles-val is deprecated.  Use yr_description-srv:joint_angles instead.")
  (joint_angles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SolveIKLeftThighResponse-request>) ostream)
  "Serializes a message object of type '<SolveIKLeftThighResponse-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_angles))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'joint_angles))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SolveIKLeftThighResponse-request>) istream)
  "Deserializes a message object of type '<SolveIKLeftThighResponse-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_angles) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_angles)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SolveIKLeftThighResponse-request>)))
  "Returns string type for a service object of type '<SolveIKLeftThighResponse-request>"
  "yr_description/SolveIKLeftThighResponseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SolveIKLeftThighResponse-request)))
  "Returns string type for a service object of type 'SolveIKLeftThighResponse-request"
  "yr_description/SolveIKLeftThighResponseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SolveIKLeftThighResponse-request>)))
  "Returns md5sum for a message object of type '<SolveIKLeftThighResponse-request>"
  "05815670e17c3341d3dc434a6547e3b1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SolveIKLeftThighResponse-request)))
  "Returns md5sum for a message object of type 'SolveIKLeftThighResponse-request"
  "05815670e17c3341d3dc434a6547e3b1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SolveIKLeftThighResponse-request>)))
  "Returns full string definition for message of type '<SolveIKLeftThighResponse-request>"
  (cl:format cl:nil "# Request~%float64[] joint_angles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SolveIKLeftThighResponse-request)))
  "Returns full string definition for message of type 'SolveIKLeftThighResponse-request"
  (cl:format cl:nil "# Request~%float64[] joint_angles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SolveIKLeftThighResponse-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_angles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SolveIKLeftThighResponse-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SolveIKLeftThighResponse-request
    (cl:cons ':joint_angles (joint_angles msg))
))
;//! \htmlinclude SolveIKLeftThighResponse-response.msg.html

(cl:defclass <SolveIKLeftThighResponse-response> (roslisp-msg-protocol:ros-message)
  ((foot_position
    :reader foot_position
    :initarg :foot_position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point)))
)

(cl:defclass SolveIKLeftThighResponse-response (<SolveIKLeftThighResponse-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SolveIKLeftThighResponse-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SolveIKLeftThighResponse-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yr_description-srv:<SolveIKLeftThighResponse-response> is deprecated: use yr_description-srv:SolveIKLeftThighResponse-response instead.")))

(cl:ensure-generic-function 'foot_position-val :lambda-list '(m))
(cl:defmethod foot_position-val ((m <SolveIKLeftThighResponse-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yr_description-srv:foot_position-val is deprecated.  Use yr_description-srv:foot_position instead.")
  (foot_position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SolveIKLeftThighResponse-response>) ostream)
  "Serializes a message object of type '<SolveIKLeftThighResponse-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'foot_position) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SolveIKLeftThighResponse-response>) istream)
  "Deserializes a message object of type '<SolveIKLeftThighResponse-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'foot_position) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SolveIKLeftThighResponse-response>)))
  "Returns string type for a service object of type '<SolveIKLeftThighResponse-response>"
  "yr_description/SolveIKLeftThighResponseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SolveIKLeftThighResponse-response)))
  "Returns string type for a service object of type 'SolveIKLeftThighResponse-response"
  "yr_description/SolveIKLeftThighResponseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SolveIKLeftThighResponse-response>)))
  "Returns md5sum for a message object of type '<SolveIKLeftThighResponse-response>"
  "05815670e17c3341d3dc434a6547e3b1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SolveIKLeftThighResponse-response)))
  "Returns md5sum for a message object of type 'SolveIKLeftThighResponse-response"
  "05815670e17c3341d3dc434a6547e3b1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SolveIKLeftThighResponse-response>)))
  "Returns full string definition for message of type '<SolveIKLeftThighResponse-response>"
  (cl:format cl:nil "# Response~%geometry_msgs/Point foot_position~%~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SolveIKLeftThighResponse-response)))
  "Returns full string definition for message of type 'SolveIKLeftThighResponse-response"
  (cl:format cl:nil "# Response~%geometry_msgs/Point foot_position~%~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SolveIKLeftThighResponse-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'foot_position))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SolveIKLeftThighResponse-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SolveIKLeftThighResponse-response
    (cl:cons ':foot_position (foot_position msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SolveIKLeftThighResponse)))
  'SolveIKLeftThighResponse-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SolveIKLeftThighResponse)))
  'SolveIKLeftThighResponse-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SolveIKLeftThighResponse)))
  "Returns string type for a service object of type '<SolveIKLeftThighResponse>"
  "yr_description/SolveIKLeftThighResponse")