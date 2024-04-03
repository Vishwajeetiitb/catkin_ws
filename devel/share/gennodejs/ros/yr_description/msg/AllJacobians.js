// Auto-generated. Do not edit!

// (in-package yr_description.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let JacobianMatrix = require('./JacobianMatrix.js');

//-----------------------------------------------------------

class AllJacobians {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.jacobians = null;
      this.names = null;
    }
    else {
      if (initObj.hasOwnProperty('jacobians')) {
        this.jacobians = initObj.jacobians
      }
      else {
        this.jacobians = [];
      }
      if (initObj.hasOwnProperty('names')) {
        this.names = initObj.names
      }
      else {
        this.names = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AllJacobians
    // Serialize message field [jacobians]
    // Serialize the length for message field [jacobians]
    bufferOffset = _serializer.uint32(obj.jacobians.length, buffer, bufferOffset);
    obj.jacobians.forEach((val) => {
      bufferOffset = JacobianMatrix.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [names]
    bufferOffset = _arraySerializer.string(obj.names, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AllJacobians
    let len;
    let data = new AllJacobians(null);
    // Deserialize message field [jacobians]
    // Deserialize array length for message field [jacobians]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.jacobians = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.jacobians[i] = JacobianMatrix.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [names]
    data.names = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.jacobians.forEach((val) => {
      length += JacobianMatrix.getMessageSize(val);
    });
    object.names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'yr_description/AllJacobians';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '027902274eec53728e88db4b2e276d6d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    JacobianMatrix[] jacobians
    string[] names  # Names of the links/end-effectors corresponding to each Jacobian
    
    ================================================================================
    MSG: yr_description/JacobianMatrix
    float64[] data  # Flattened matrix data
    uint32 rows     # Number of rows in the matrix
    uint32 columns  # Number of columns in the matrix
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AllJacobians(null);
    if (msg.jacobians !== undefined) {
      resolved.jacobians = new Array(msg.jacobians.length);
      for (let i = 0; i < resolved.jacobians.length; ++i) {
        resolved.jacobians[i] = JacobianMatrix.Resolve(msg.jacobians[i]);
      }
    }
    else {
      resolved.jacobians = []
    }

    if (msg.names !== undefined) {
      resolved.names = msg.names;
    }
    else {
      resolved.names = []
    }

    return resolved;
    }
};

module.exports = AllJacobians;
