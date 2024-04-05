; Auto-generated. Do not edit!


(cl:in-package yr_description-srv)


;//! \htmlinclude SolveIKRightThighResponse-request.msg.html

(cl:defclass <SolveIKRightThighResponse-request> (roslisp-msg-protocol:ros-message)
  ((joint_angles
    :reader joint_angles
    :initarg :joint_angles
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass SolveIKRightThighResponse-request (<SolveIKRightThighResponse-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SolveIKRightThighResponse-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SolveIKRightThighResponse-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yr_description-srv:<SolveIKRightThighResponse-request> is deprecated: use yr_description-srv:SolveIKRightThighResponse-request instead.")))

(cl:ensure-generic-function 'joint_angles-val :lambda-list '(m))
(cl:defmethod joint_angles-val ((m <SolveIKRightThighResponse-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yr_description-srv:joint_angles-val is deprecated.  Use yr_description-srv:joint_angles instead.")
  (joint_angles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SolveIKRightThighResponse-request>) ostream)
  "Serializes a message object of type '<SolveIKRightThighResponse-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SolveIKRightThighResponse-request>) istream)
  "Deserializes a message object of type '<SolveIKRightThighResponse-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SolveIKRightThighResponse-request>)))
  "Returns string type for a service object of type '<SolveIKRightThighResponse-request>"
  "yr_description/SolveIKRightThighResponseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SolveIKRightThighResponse-request)))
  "Returns string type for a service object of type 'SolveIKRightThighResponse-request"
  "yr_description/SolveIKRightThighResponseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SolveIKRightThighResponse-request>)))
  "Returns md5sum for a message object of type '<SolveIKRightThighResponse-request>"
  "05815670e17c3341d3dc434a6547e3b1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SolveIKRightThighResponse-request)))
  "Returns md5sum for a message object of type 'SolveIKRightThighResponse-request"
  "05815670e17c3341d3dc434a6547e3b1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SolveIKRightThighResponse-request>)))
  "Returns full string definition for message of type '<SolveIKRightThighResponse-request>"
  (cl:format cl:nil "# Request~%float64[] joint_angles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SolveIKRightThighResponse-request)))
  "Returns full string definition for message of type 'SolveIKRightThighResponse-request"
  (cl:format cl:nil "# Request~%float64[] joint_angles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SolveIKRightThighResponse-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_angles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SolveIKRightThighResponse-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SolveIKRightThighResponse-request
    (cl:cons ':joint_angles (joint_angles msg))
))
;//! \htmlinclude SolveIKRightThighResponse-response.msg.html

(cl:defclass <SolveIKRightThighResponse-response> (roslisp-msg-protocol:ros-message)
  ((foot_position
    :reader foot_position
    :initarg :foot_position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point)))
)

(cl:defclass SolveIKRightThighResponse-response (<SolveIKRightThighResponse-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SolveIKRightThighResponse-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SolveIKRightThighResponse-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yr_description-srv:<SolveIKRightThighResponse-response> is deprecated: use yr_description-srv:SolveIKRightThighResponse-response instead.")))

(cl:ensure-generic-function 'foot_position-val :lambda-list '(m))
(cl:defmethod foot_position-val ((m <SolveIKRightThighResponse-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yr_description-srv:foot_position-val is deprecated.  Use yr_description-srv:foot_position instead.")
  (foot_position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SolveIKRightThighResponse-response>) ostream)
  "Serializes a message object of type '<SolveIKRightThighResponse-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'foot_position) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SolveIKRightThighResponse-response>) istream)
  "Deserializes a message object of type '<SolveIKRightThighResponse-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'foot_position) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SolveIKRightThighResponse-response>)))
  "Returns string type for a service object of type '<SolveIKRightThighResponse-response>"
  "yr_description/SolveIKRightThighResponseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SolveIKRightThighResponse-response)))
  "Returns string type for a service object of type 'SolveIKRightThighResponse-response"
  "yr_description/SolveIKRightThighResponseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SolveIKRightThighResponse-response>)))
  "Returns md5sum for a message object of type '<SolveIKRightThighResponse-response>"
  "05815670e17c3341d3dc434a6547e3b1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SolveIKRightThighResponse-response)))
  "Returns md5sum for a message object of type 'SolveIKRightThighResponse-response"
  "05815670e17c3341d3dc434a6547e3b1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SolveIKRightThighResponse-response>)))
  "Returns full string definition for message of type '<SolveIKRightThighResponse-response>"
  (cl:format cl:nil "# Response~%geometry_msgs/Point foot_position~%~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SolveIKRightThighResponse-response)))
  "Returns full string definition for message of type 'SolveIKRightThighResponse-response"
  (cl:format cl:nil "# Response~%geometry_msgs/Point foot_position~%~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SolveIKRightThighResponse-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'foot_position))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SolveIKRightThighResponse-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SolveIKRightThighResponse-response
    (cl:cons ':foot_position (foot_position msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SolveIKRightThighResponse)))
  'SolveIKRightThighResponse-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SolveIKRightThighResponse)))
  'SolveIKRightThighResponse-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SolveIKRightThighResponse)))
  "Returns string type for a service object of type '<SolveIKRightThighResponse>"
  "yr_description/SolveIKRightThighResponse")