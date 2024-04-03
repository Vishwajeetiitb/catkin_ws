// Auto-generated. Do not edit!

// (in-package stairs_detection.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class stair_info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pose = null;
      this.step_width = null;
      this.step_height = null;
      this.step_length = null;
      this.is_ascent = null;
    }
    else {
      if (initObj.hasOwnProperty('pose')) {
        this.pose = initObj.pose
      }
      else {
        this.pose = new geometry_msgs.msg.PoseStamped();
      }
      if (initObj.hasOwnProperty('step_width')) {
        this.step_width = initObj.step_width
      }
      else {
        this.step_width = 0.0;
      }
      if (initObj.hasOwnProperty('step_height')) {
        this.step_height = initObj.step_height
      }
      else {
        this.step_height = 0.0;
      }
      if (initObj.hasOwnProperty('step_length')) {
        this.step_length = initObj.step_length
      }
      else {
        this.step_length = 0.0;
      }
      if (initObj.hasOwnProperty('is_ascent')) {
        this.is_ascent = initObj.is_ascent
      }
      else {
        this.is_ascent = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type stair_info
    // Serialize message field [pose]
    bufferOffset = geometry_msgs.msg.PoseStamped.serialize(obj.pose, buffer, bufferOffset);
    // Serialize message field [step_width]
    bufferOffset = _serializer.float64(obj.step_width, buffer, bufferOffset);
    // Serialize message field [step_height]
    bufferOffset = _serializer.float64(obj.step_height, buffer, bufferOffset);
    // Serialize message field [step_length]
    bufferOffset = _serializer.float64(obj.step_length, buffer, bufferOffset);
    // Serialize message field [is_ascent]
    bufferOffset = _serializer.bool(obj.is_ascent, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type stair_info
    let len;
    let data = new stair_info(null);
    // Deserialize message field [pose]
    data.pose = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [step_width]
    data.step_width = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [step_height]
    data.step_height = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [step_length]
    data.step_length = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [is_ascent]
    data.is_ascent = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += geometry_msgs.msg.PoseStamped.getMessageSize(object.pose);
    return length + 25;
  }

  static datatype() {
    // Returns string type for a message object
    return 'stairs_detection/stair_info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '51b1f35e0c993fc5f498ebf9309e69d5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # StairStep.msg
    geometry_msgs/PoseStamped pose
    float64 step_width
    float64 step_height
    float64 step_length
    bool is_ascent
    
    ================================================================================
    MSG: geometry_msgs/PoseStamped
    # A Pose with reference coordinate frame and timestamp
    Header header
    Pose pose
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new stair_info(null);
    if (msg.pose !== undefined) {
      resolved.pose = geometry_msgs.msg.PoseStamped.Resolve(msg.pose)
    }
    else {
      resolved.pose = new geometry_msgs.msg.PoseStamped()
    }

    if (msg.step_width !== undefined) {
      resolved.step_width = msg.step_width;
    }
    else {
      resolved.step_width = 0.0
    }

    if (msg.step_height !== undefined) {
      resolved.step_height = msg.step_height;
    }
    else {
      resolved.step_height = 0.0
    }

    if (msg.step_length !== undefined) {
      resolved.step_length = msg.step_length;
    }
    else {
      resolved.step_length = 0.0
    }

    if (msg.is_ascent !== undefined) {
      resolved.is_ascent = msg.is_ascent;
    }
    else {
      resolved.is_ascent = false
    }

    return resolved;
    }
};

module.exports = stair_info;
