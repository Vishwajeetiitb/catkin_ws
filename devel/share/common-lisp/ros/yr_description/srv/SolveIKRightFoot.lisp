; Auto-generated. Do not edit!


(cl:in-package yr_description-srv)


;//! \htmlinclude SolveIKRightFoot-request.msg.html

(cl:defclass <SolveIKRightFoot-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (roll
    :reader roll
    :initarg :roll
    :type cl:float
    :initform 0.0)
   (pitch
    :reader pitch
    :initarg :pitch
    :type cl:float
    :initform 0.0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0))
)

(cl:defclass SolveIKRightFoot-request (<SolveIKRightFoot-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SolveIKRightFoot-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SolveIKRightFoot-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yr_description-srv:<SolveIKRightFoot-request> is deprecated: use yr_description-srv:SolveIKRightFoot-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <SolveIKRightFoot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yr_description-srv:x-val is deprecated.  Use yr_description-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <SolveIKRightFoot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yr_description-srv:y-val is deprecated.  Use yr_description-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <SolveIKRightFoot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yr_description-srv:z-val is deprecated.  Use yr_description-srv:z instead.")
  (z m))

(cl:ensure-generic-function 'roll-val :lambda-list '(m))
(cl:defmethod roll-val ((m <SolveIKRightFoot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yr_description-srv:roll-val is deprecated.  Use yr_description-srv:roll instead.")
  (roll m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <SolveIKRightFoot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yr_description-srv:pitch-val is deprecated.  Use yr_description-srv:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <SolveIKRightFoot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yr_description-srv:yaw-val is deprecated.  Use yr_description-srv:yaw instead.")
  (yaw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SolveIKRightFoot-request>) ostream)
  "Serializes a message object of type '<SolveIKRightFoot-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SolveIKRightFoot-request>) istream)
  "Deserializes a message object of type '<SolveIKRightFoot-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SolveIKRightFoot-request>)))
  "Returns string type for a service object of type '<SolveIKRightFoot-request>"
  "yr_description/SolveIKRightFootRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SolveIKRightFoot-request)))
  "Returns string type for a service object of type 'SolveIKRightFoot-request"
  "yr_description/SolveIKRightFootRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SolveIKRightFoot-request>)))
  "Returns md5sum for a message object of type '<SolveIKRightFoot-request>"
  "2d3149f50ac2299a08916bb78e0c6b8d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SolveIKRightFoot-request)))
  "Returns md5sum for a message object of type 'SolveIKRightFoot-request"
  "2d3149f50ac2299a08916bb78e0c6b8d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SolveIKRightFoot-request>)))
  "Returns full string definition for message of type '<SolveIKRightFoot-request>"
  (cl:format cl:nil "# SolveIKRightFoot.srv~%# Request~%float64 x~%float64 y~%float64 z~%float64 roll~%float64 pitch~%float64 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SolveIKRightFoot-request)))
  "Returns full string definition for message of type 'SolveIKRightFoot-request"
  (cl:format cl:nil "# SolveIKRightFoot.srv~%# Request~%float64 x~%float64 y~%float64 z~%float64 roll~%float64 pitch~%float64 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SolveIKRightFoot-request>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SolveIKRightFoot-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SolveIKRightFoot-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':roll (roll msg))
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':yaw (yaw msg))
))
;//! \htmlinclude SolveIKRightFoot-response.msg.html

(cl:defclass <SolveIKRightFoot-response> (roslisp-msg-protocol:ros-message)
  ((joint_angles
    :reader joint_angles
    :initarg :joint_angles
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass SolveIKRightFoot-response (<SolveIKRightFoot-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SolveIKRightFoot-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SolveIKRightFoot-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yr_description-srv:<SolveIKRightFoot-response> is deprecated: use yr_description-srv:SolveIKRightFoot-response instead.")))

(cl:ensure-generic-function 'joint_angles-val :lambda-list '(m))
(cl:defmethod joint_angles-val ((m <SolveIKRightFoot-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yr_description-srv:joint_angles-val is deprecated.  Use yr_description-srv:joint_angles instead.")
  (joint_angles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SolveIKRightFoot-response>) ostream)
  "Serializes a message object of type '<SolveIKRightFoot-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SolveIKRightFoot-response>) istream)
  "Deserializes a message object of type '<SolveIKRightFoot-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SolveIKRightFoot-response>)))
  "Returns string type for a service object of type '<SolveIKRightFoot-response>"
  "yr_description/SolveIKRightFootResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SolveIKRightFoot-response)))
  "Returns string type for a service object of type 'SolveIKRightFoot-response"
  "yr_description/SolveIKRightFootResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SolveIKRightFoot-response>)))
  "Returns md5sum for a message object of type '<SolveIKRightFoot-response>"
  "2d3149f50ac2299a08916bb78e0c6b8d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SolveIKRightFoot-response)))
  "Returns md5sum for a message object of type 'SolveIKRightFoot-response"
  "2d3149f50ac2299a08916bb78e0c6b8d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SolveIKRightFoot-response>)))
  "Returns full string definition for message of type '<SolveIKRightFoot-response>"
  (cl:format cl:nil "# Response~%float64[] joint_angles~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SolveIKRightFoot-response)))
  "Returns full string definition for message of type 'SolveIKRightFoot-response"
  (cl:format cl:nil "# Response~%float64[] joint_angles~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SolveIKRightFoot-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_angles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SolveIKRightFoot-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SolveIKRightFoot-response
    (cl:cons ':joint_angles (joint_angles msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SolveIKRightFoot)))
  'SolveIKRightFoot-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SolveIKRightFoot)))
  'SolveIKRightFoot-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SolveIKRightFoot)))
  "Returns string type for a service object of type '<SolveIKRightFoot>"
  "yr_description/SolveIKRightFoot")