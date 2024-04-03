; Auto-generated. Do not edit!


(cl:in-package yr_description-msg)


;//! \htmlinclude AllJacobians.msg.html

(cl:defclass <AllJacobians> (roslisp-msg-protocol:ros-message)
  ((jacobians
    :reader jacobians
    :initarg :jacobians
    :type (cl:vector yr_description-msg:JacobianMatrix)
   :initform (cl:make-array 0 :element-type 'yr_description-msg:JacobianMatrix :initial-element (cl:make-instance 'yr_description-msg:JacobianMatrix)))
   (names
    :reader names
    :initarg :names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass AllJacobians (<AllJacobians>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AllJacobians>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AllJacobians)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yr_description-msg:<AllJacobians> is deprecated: use yr_description-msg:AllJacobians instead.")))

(cl:ensure-generic-function 'jacobians-val :lambda-list '(m))
(cl:defmethod jacobians-val ((m <AllJacobians>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yr_description-msg:jacobians-val is deprecated.  Use yr_description-msg:jacobians instead.")
  (jacobians m))

(cl:ensure-generic-function 'names-val :lambda-list '(m))
(cl:defmethod names-val ((m <AllJacobians>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yr_description-msg:names-val is deprecated.  Use yr_description-msg:names instead.")
  (names m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AllJacobians>) ostream)
  "Serializes a message object of type '<AllJacobians>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'jacobians))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'jacobians))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'names))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'names))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AllJacobians>) istream)
  "Deserializes a message object of type '<AllJacobians>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'jacobians) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'jacobians)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'yr_description-msg:JacobianMatrix))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'names)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AllJacobians>)))
  "Returns string type for a message object of type '<AllJacobians>"
  "yr_description/AllJacobians")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AllJacobians)))
  "Returns string type for a message object of type 'AllJacobians"
  "yr_description/AllJacobians")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AllJacobians>)))
  "Returns md5sum for a message object of type '<AllJacobians>"
  "027902274eec53728e88db4b2e276d6d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AllJacobians)))
  "Returns md5sum for a message object of type 'AllJacobians"
  "027902274eec53728e88db4b2e276d6d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AllJacobians>)))
  "Returns full string definition for message of type '<AllJacobians>"
  (cl:format cl:nil "JacobianMatrix[] jacobians~%string[] names  # Names of the links/end-effectors corresponding to each Jacobian~%~%================================================================================~%MSG: yr_description/JacobianMatrix~%float64[] data  # Flattened matrix data~%uint32 rows     # Number of rows in the matrix~%uint32 columns  # Number of columns in the matrix~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AllJacobians)))
  "Returns full string definition for message of type 'AllJacobians"
  (cl:format cl:nil "JacobianMatrix[] jacobians~%string[] names  # Names of the links/end-effectors corresponding to each Jacobian~%~%================================================================================~%MSG: yr_description/JacobianMatrix~%float64[] data  # Flattened matrix data~%uint32 rows     # Number of rows in the matrix~%uint32 columns  # Number of columns in the matrix~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AllJacobians>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'jacobians) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AllJacobians>))
  "Converts a ROS message object to a list"
  (cl:list 'AllJacobians
    (cl:cons ':jacobians (jacobians msg))
    (cl:cons ':names (names msg))
))
