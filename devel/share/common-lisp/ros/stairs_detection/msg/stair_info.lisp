; Auto-generated. Do not edit!


(cl:in-package stairs_detection-msg)


;//! \htmlinclude stair_info.msg.html

(cl:defclass <stair_info> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (step_width
    :reader step_width
    :initarg :step_width
    :type cl:float
    :initform 0.0)
   (step_height
    :reader step_height
    :initarg :step_height
    :type cl:float
    :initform 0.0)
   (step_length
    :reader step_length
    :initarg :step_length
    :type cl:float
    :initform 0.0)
   (is_ascent
    :reader is_ascent
    :initarg :is_ascent
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass stair_info (<stair_info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <stair_info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'stair_info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name stairs_detection-msg:<stair_info> is deprecated: use stairs_detection-msg:stair_info instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <stair_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stairs_detection-msg:pose-val is deprecated.  Use stairs_detection-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'step_width-val :lambda-list '(m))
(cl:defmethod step_width-val ((m <stair_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stairs_detection-msg:step_width-val is deprecated.  Use stairs_detection-msg:step_width instead.")
  (step_width m))

(cl:ensure-generic-function 'step_height-val :lambda-list '(m))
(cl:defmethod step_height-val ((m <stair_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stairs_detection-msg:step_height-val is deprecated.  Use stairs_detection-msg:step_height instead.")
  (step_height m))

(cl:ensure-generic-function 'step_length-val :lambda-list '(m))
(cl:defmethod step_length-val ((m <stair_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stairs_detection-msg:step_length-val is deprecated.  Use stairs_detection-msg:step_length instead.")
  (step_length m))

(cl:ensure-generic-function 'is_ascent-val :lambda-list '(m))
(cl:defmethod is_ascent-val ((m <stair_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stairs_detection-msg:is_ascent-val is deprecated.  Use stairs_detection-msg:is_ascent instead.")
  (is_ascent m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <stair_info>) ostream)
  "Serializes a message object of type '<stair_info>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'step_width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'step_height))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'step_length))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_ascent) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <stair_info>) istream)
  "Deserializes a message object of type '<stair_info>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'step_width) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'step_height) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'step_length) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'is_ascent) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<stair_info>)))
  "Returns string type for a message object of type '<stair_info>"
  "stairs_detection/stair_info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stair_info)))
  "Returns string type for a message object of type 'stair_info"
  "stairs_detection/stair_info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<stair_info>)))
  "Returns md5sum for a message object of type '<stair_info>"
  "51b1f35e0c993fc5f498ebf9309e69d5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'stair_info)))
  "Returns md5sum for a message object of type 'stair_info"
  "51b1f35e0c993fc5f498ebf9309e69d5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<stair_info>)))
  "Returns full string definition for message of type '<stair_info>"
  (cl:format cl:nil "# StairStep.msg~%geometry_msgs/PoseStamped pose~%float64 step_width~%float64 step_height~%float64 step_length~%bool is_ascent~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'stair_info)))
  "Returns full string definition for message of type 'stair_info"
  (cl:format cl:nil "# StairStep.msg~%geometry_msgs/PoseStamped pose~%float64 step_width~%float64 step_height~%float64 step_length~%bool is_ascent~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <stair_info>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     8
     8
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <stair_info>))
  "Converts a ROS message object to a list"
  (cl:list 'stair_info
    (cl:cons ':pose (pose msg))
    (cl:cons ':step_width (step_width msg))
    (cl:cons ':step_height (step_height msg))
    (cl:cons ':step_length (step_length msg))
    (cl:cons ':is_ascent (is_ascent msg))
))
