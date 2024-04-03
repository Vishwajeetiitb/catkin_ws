; Auto-generated. Do not edit!


(cl:in-package yr_description-msg)


;//! \htmlinclude JacobianMatrix.msg.html

(cl:defclass <JacobianMatrix> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (rows
    :reader rows
    :initarg :rows
    :type cl:integer
    :initform 0)
   (columns
    :reader columns
    :initarg :columns
    :type cl:integer
    :initform 0))
)

(cl:defclass JacobianMatrix (<JacobianMatrix>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JacobianMatrix>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JacobianMatrix)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yr_description-msg:<JacobianMatrix> is deprecated: use yr_description-msg:JacobianMatrix instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <JacobianMatrix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yr_description-msg:data-val is deprecated.  Use yr_description-msg:data instead.")
  (data m))

(cl:ensure-generic-function 'rows-val :lambda-list '(m))
(cl:defmethod rows-val ((m <JacobianMatrix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yr_description-msg:rows-val is deprecated.  Use yr_description-msg:rows instead.")
  (rows m))

(cl:ensure-generic-function 'columns-val :lambda-list '(m))
(cl:defmethod columns-val ((m <JacobianMatrix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yr_description-msg:columns-val is deprecated.  Use yr_description-msg:columns instead.")
  (columns m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JacobianMatrix>) ostream)
  "Serializes a message object of type '<JacobianMatrix>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
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
   (cl:slot-value msg 'data))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rows)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rows)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'rows)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'rows)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'columns)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'columns)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'columns)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'columns)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JacobianMatrix>) istream)
  "Deserializes a message object of type '<JacobianMatrix>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
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
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rows)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rows)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'rows)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'rows)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'columns)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'columns)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'columns)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'columns)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JacobianMatrix>)))
  "Returns string type for a message object of type '<JacobianMatrix>"
  "yr_description/JacobianMatrix")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JacobianMatrix)))
  "Returns string type for a message object of type 'JacobianMatrix"
  "yr_description/JacobianMatrix")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JacobianMatrix>)))
  "Returns md5sum for a message object of type '<JacobianMatrix>"
  "c15edb606601a21cc2f127b349ea452b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JacobianMatrix)))
  "Returns md5sum for a message object of type 'JacobianMatrix"
  "c15edb606601a21cc2f127b349ea452b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JacobianMatrix>)))
  "Returns full string definition for message of type '<JacobianMatrix>"
  (cl:format cl:nil "float64[] data  # Flattened matrix data~%uint32 rows     # Number of rows in the matrix~%uint32 columns  # Number of columns in the matrix~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JacobianMatrix)))
  "Returns full string definition for message of type 'JacobianMatrix"
  (cl:format cl:nil "float64[] data  # Flattened matrix data~%uint32 rows     # Number of rows in the matrix~%uint32 columns  # Number of columns in the matrix~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JacobianMatrix>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JacobianMatrix>))
  "Converts a ROS message object to a list"
  (cl:list 'JacobianMatrix
    (cl:cons ':data (data msg))
    (cl:cons ':rows (rows msg))
    (cl:cons ':columns (columns msg))
))
