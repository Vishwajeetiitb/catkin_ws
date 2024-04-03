// Auto-generated. Do not edit!

// (in-package yr_description.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class JacobianMatrix {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.data = null;
      this.rows = null;
      this.columns = null;
    }
    else {
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = [];
      }
      if (initObj.hasOwnProperty('rows')) {
        this.rows = initObj.rows
      }
      else {
        this.rows = 0;
      }
      if (initObj.hasOwnProperty('columns')) {
        this.columns = initObj.columns
      }
      else {
        this.columns = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JacobianMatrix
    // Serialize message field [data]
    bufferOffset = _arraySerializer.float64(obj.data, buffer, bufferOffset, null);
    // Serialize message field [rows]
    bufferOffset = _serializer.uint32(obj.rows, buffer, bufferOffset);
    // Serialize message field [columns]
    bufferOffset = _serializer.uint32(obj.columns, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JacobianMatrix
    let len;
    let data = new JacobianMatrix(null);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [rows]
    data.rows = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [columns]
    data.columns = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.data.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'yr_description/JacobianMatrix';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c15edb606601a21cc2f127b349ea452b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new JacobianMatrix(null);
    if (msg.data !== undefined) {
      resolved.data = msg.data;
    }
    else {
      resolved.data = []
    }

    if (msg.rows !== undefined) {
      resolved.rows = msg.rows;
    }
    else {
      resolved.rows = 0
    }

    if (msg.columns !== undefined) {
      resolved.columns = msg.columns;
    }
    else {
      resolved.columns = 0
    }

    return resolved;
    }
};

module.exports = JacobianMatrix;
