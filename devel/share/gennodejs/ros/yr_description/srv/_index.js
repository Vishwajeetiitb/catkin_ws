
"use strict";

let SolveIKRightFoot = require('./SolveIKRightFoot.js')
let ComputeRightFootPosition = require('./ComputeRightFootPosition.js')
let SolveIKRightThigh = require('./SolveIKRightThigh.js')
let IKLeft = require('./IKLeft.js')
let SolveIKLeftThigh = require('./SolveIKLeftThigh.js')
let ComputeLeftFootPosition = require('./ComputeLeftFootPosition.js')
let SolveIKLeftFoot = require('./SolveIKLeftFoot.js')
let IKRight = require('./IKRight.js')

module.exports = {
  SolveIKRightFoot: SolveIKRightFoot,
  ComputeRightFootPosition: ComputeRightFootPosition,
  SolveIKRightThigh: SolveIKRightThigh,
  IKLeft: IKLeft,
  SolveIKLeftThigh: SolveIKLeftThigh,
  ComputeLeftFootPosition: ComputeLeftFootPosition,
  SolveIKLeftFoot: SolveIKLeftFoot,
  IKRight: IKRight,
};
