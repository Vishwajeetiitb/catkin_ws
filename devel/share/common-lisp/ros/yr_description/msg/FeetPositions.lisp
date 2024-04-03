; Auto-generated. Do not edit!


(cl:in-package yr_description-msg)


;//! \htmlinclude FeetPositions.msg.html

(cl:defclass <FeetPositions> (roslisp-msg-protocol:ros-message)
  ((left_foot
    :reader left_foot
    :initarg :left_foot
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (right_foot
    :reader right_foot
    :initarg :right_foot
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point)))
)

(cl:defclass FeetPositions (<FeetPositions>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FeetPositions>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FeetPositions)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yr_description-msg:<FeetPositions> is deprecated: use yr_description-msg:FeetPositions instead.")))

(cl:ensure-generic-function 'left_foot-val :lambda-list '(m))
(cl:defmethod left_foot-val ((m <FeetPositions>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yr_description-msg:left_foot-val is deprecated.  Use yr_description-msg:left_foot instead.")
  (left_foot m))

(cl:ensure-generic-function 'right_foot-val :lambda-list '(m))
(cl:defmethod right_foot-val ((m <FeetPositions>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yr_description-msg:right_foot-val is deprecated.  Use yr_description-msg:right_foot instead.")
  (right_foot m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FeetPositions>) ostream)
  "Serializes a message object of type '<FeetPositions>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'left_foot) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'right_foot) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FeetPositions>) istream)
  "Deserializes a message object of type '<FeetPositions>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'left_foot) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'right_foot) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FeetPositions>)))
  "Returns string type for a message object of type '<FeetPositions>"
  "yr_description/FeetPositions")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FeetPositions)))
  "Returns string type for a message object of type 'FeetPositions"
  "yr_description/FeetPositions")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FeetPositions>)))
  "Returns md5sum for a message object of type '<FeetPositions>"
  "d71882dfd7fa607b1ca2fb34f4c223ba")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FeetPositions)))
  "Returns md5sum for a message object of type 'FeetPositions"
  "d71882dfd7fa607b1ca2fb34f4c223ba")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FeetPositions>)))
  "Returns full string definition for message of type '<FeetPositions>"
  (cl:format cl:nil "geometry_msgs/Point left_foot~%geometry_msgs/Point right_foot~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FeetPositions)))
  "Returns full string definition for message of type 'FeetPositions"
  (cl:format cl:nil "geometry_msgs/Point left_foot~%geometry_msgs/Point right_foot~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FeetPositions>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'left_foot))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'right_foot))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FeetPositions>))
  "Converts a ROS message object to a list"
  (cl:list 'FeetPositions
    (cl:cons ':left_foot (left_foot msg))
    (cl:cons ':right_foot (right_foot msg))
))
