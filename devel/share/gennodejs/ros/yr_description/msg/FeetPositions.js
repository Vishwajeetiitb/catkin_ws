// Auto-generated. Do not edit!

// (in-package yr_description.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class FeetPositions {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.left_foot = null;
      this.right_foot = null;
    }
    else {
      if (initObj.hasOwnProperty('left_foot')) {
        this.left_foot = initObj.left_foot
      }
      else {
        this.left_foot = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('right_foot')) {
        this.right_foot = initObj.right_foot
      }
      else {
        this.right_foot = new geometry_msgs.msg.Point();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FeetPositions
    // Serialize message field [left_foot]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.left_foot, buffer, bufferOffset);
    // Serialize message field [right_foot]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.right_foot, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FeetPositions
    let len;
    let data = new FeetPositions(null);
    // Deserialize message field [left_foot]
    data.left_foot = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [right_foot]
    data.right_foot = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'yr_description/FeetPositions';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd71882dfd7fa607b1ca2fb34f4c223ba';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point left_foot
    geometry_msgs/Point right_foot
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FeetPositions(null);
    if (msg.left_foot !== undefined) {
      resolved.left_foot = geometry_msgs.msg.Point.Resolve(msg.left_foot)
    }
    else {
      resolved.left_foot = new geometry_msgs.msg.Point()
    }

    if (msg.right_foot !== undefined) {
      resolved.right_foot = geometry_msgs.msg.Point.Resolve(msg.right_foot)
    }
    else {
      resolved.right_foot = new geometry_msgs.msg.Point()
    }

    return resolved;
    }
};

module.exports = FeetPositions;
