// Auto-generated. Do not edit!

// (in-package yr_description.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class ComputeRightFootPositionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_angles = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_angles')) {
        this.joint_angles = initObj.joint_angles
      }
      else {
        this.joint_angles = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ComputeRightFootPositionRequest
    // Serialize message field [joint_angles]
    bufferOffset = _arraySerializer.float64(obj.joint_angles, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ComputeRightFootPositionRequest
    let len;
    let data = new ComputeRightFootPositionRequest(null);
    // Deserialize message field [joint_angles]
    data.joint_angles = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.joint_angles.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'yr_description/ComputeRightFootPositionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9eebf9cc7d525d143ad033b65dacb648';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Request
    float64[] joint_angles
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ComputeRightFootPositionRequest(null);
    if (msg.joint_angles !== undefined) {
      resolved.joint_angles = msg.joint_angles;
    }
    else {
      resolved.joint_angles = []
    }

    return resolved;
    }
};

class ComputeRightFootPositionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.foot_position = null;
    }
    else {
      if (initObj.hasOwnProperty('foot_position')) {
        this.foot_position = initObj.foot_position
      }
      else {
        this.foot_position = new geometry_msgs.msg.Point();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ComputeRightFootPositionResponse
    // Serialize message field [foot_position]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.foot_position, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ComputeRightFootPositionResponse
    let len;
    let data = new ComputeRightFootPositionResponse(null);
    // Deserialize message field [foot_position]
    data.foot_position = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'yr_description/ComputeRightFootPositionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '877ea7c2b80fdb8aa336bbc2f43238ae';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Response
    geometry_msgs/Point foot_position
    
    
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
    const resolved = new ComputeRightFootPositionResponse(null);
    if (msg.foot_position !== undefined) {
      resolved.foot_position = geometry_msgs.msg.Point.Resolve(msg.foot_position)
    }
    else {
      resolved.foot_position = new geometry_msgs.msg.Point()
    }

    return resolved;
    }
};

module.exports = {
  Request: ComputeRightFootPositionRequest,
  Response: ComputeRightFootPositionResponse,
  md5sum() { return '05815670e17c3341d3dc434a6547e3b1'; },
  datatype() { return 'yr_description/ComputeRightFootPosition'; }
};
