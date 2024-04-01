// Generated by gencpp from file unitree_legged_msgs/HighState.msg
// DO NOT EDIT!


#ifndef UNITREE_LEGGED_MSGS_MESSAGE_HIGHSTATE_H
#define UNITREE_LEGGED_MSGS_MESSAGE_HIGHSTATE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <unitree_legged_msgs/IMU.h>
#include <unitree_legged_msgs/MotorState.h>
#include <unitree_legged_msgs/BmsState.h>
#include <unitree_legged_msgs/Cartesian.h>
#include <unitree_legged_msgs/Cartesian.h>

namespace unitree_legged_msgs
{
template <class ContainerAllocator>
struct HighState_
{
  typedef HighState_<ContainerAllocator> Type;

  HighState_()
    : head()
    , levelFlag(0)
    , frameReserve(0)
    , SN()
    , version()
    , bandWidth(0)
    , imu()
    , motorState()
    , bms()
    , footForce()
    , footForceEst()
    , mode(0)
    , progress(0.0)
    , gaitType(0)
    , footRaiseHeight(0.0)
    , position()
    , bodyHeight(0.0)
    , velocity()
    , yawSpeed(0.0)
    , rangeObstacle()
    , footPosition2Body()
    , footSpeed2Body()
    , wirelessRemote()
    , reserve(0)
    , crc(0)  {
      head.assign(0);

      SN.assign(0);

      version.assign(0);

      footForce.assign(0);

      footForceEst.assign(0);

      position.assign(0.0);

      velocity.assign(0.0);

      rangeObstacle.assign(0.0);

      wirelessRemote.assign(0);
  }
  HighState_(const ContainerAllocator& _alloc)
    : head()
    , levelFlag(0)
    , frameReserve(0)
    , SN()
    , version()
    , bandWidth(0)
    , imu(_alloc)
    , motorState()
    , bms(_alloc)
    , footForce()
    , footForceEst()
    , mode(0)
    , progress(0.0)
    , gaitType(0)
    , footRaiseHeight(0.0)
    , position()
    , bodyHeight(0.0)
    , velocity()
    , yawSpeed(0.0)
    , rangeObstacle()
    , footPosition2Body()
    , footSpeed2Body()
    , wirelessRemote()
    , reserve(0)
    , crc(0)  {
  (void)_alloc;
      head.assign(0);

      SN.assign(0);

      version.assign(0);

      motorState.assign( ::unitree_legged_msgs::MotorState_<ContainerAllocator> (_alloc));

      footForce.assign(0);

      footForceEst.assign(0);

      position.assign(0.0);

      velocity.assign(0.0);

      rangeObstacle.assign(0.0);

      footPosition2Body.assign( ::unitree_legged_msgs::Cartesian_<ContainerAllocator> (_alloc));

      footSpeed2Body.assign( ::unitree_legged_msgs::Cartesian_<ContainerAllocator> (_alloc));

      wirelessRemote.assign(0);
  }



   typedef boost::array<uint8_t, 2>  _head_type;
  _head_type head;

   typedef uint8_t _levelFlag_type;
  _levelFlag_type levelFlag;

   typedef uint8_t _frameReserve_type;
  _frameReserve_type frameReserve;

   typedef boost::array<uint32_t, 2>  _SN_type;
  _SN_type SN;

   typedef boost::array<uint32_t, 2>  _version_type;
  _version_type version;

   typedef uint16_t _bandWidth_type;
  _bandWidth_type bandWidth;

   typedef  ::unitree_legged_msgs::IMU_<ContainerAllocator>  _imu_type;
  _imu_type imu;

   typedef boost::array< ::unitree_legged_msgs::MotorState_<ContainerAllocator> , 20>  _motorState_type;
  _motorState_type motorState;

   typedef  ::unitree_legged_msgs::BmsState_<ContainerAllocator>  _bms_type;
  _bms_type bms;

   typedef boost::array<int16_t, 4>  _footForce_type;
  _footForce_type footForce;

   typedef boost::array<int16_t, 4>  _footForceEst_type;
  _footForceEst_type footForceEst;

   typedef uint8_t _mode_type;
  _mode_type mode;

   typedef float _progress_type;
  _progress_type progress;

   typedef uint8_t _gaitType_type;
  _gaitType_type gaitType;

   typedef float _footRaiseHeight_type;
  _footRaiseHeight_type footRaiseHeight;

   typedef boost::array<float, 3>  _position_type;
  _position_type position;

   typedef float _bodyHeight_type;
  _bodyHeight_type bodyHeight;

   typedef boost::array<float, 3>  _velocity_type;
  _velocity_type velocity;

   typedef float _yawSpeed_type;
  _yawSpeed_type yawSpeed;

   typedef boost::array<float, 4>  _rangeObstacle_type;
  _rangeObstacle_type rangeObstacle;

   typedef boost::array< ::unitree_legged_msgs::Cartesian_<ContainerAllocator> , 4>  _footPosition2Body_type;
  _footPosition2Body_type footPosition2Body;

   typedef boost::array< ::unitree_legged_msgs::Cartesian_<ContainerAllocator> , 4>  _footSpeed2Body_type;
  _footSpeed2Body_type footSpeed2Body;

   typedef boost::array<uint8_t, 40>  _wirelessRemote_type;
  _wirelessRemote_type wirelessRemote;

   typedef uint32_t _reserve_type;
  _reserve_type reserve;

   typedef uint32_t _crc_type;
  _crc_type crc;





  typedef boost::shared_ptr< ::unitree_legged_msgs::HighState_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::unitree_legged_msgs::HighState_<ContainerAllocator> const> ConstPtr;

}; // struct HighState_

typedef ::unitree_legged_msgs::HighState_<std::allocator<void> > HighState;

typedef boost::shared_ptr< ::unitree_legged_msgs::HighState > HighStatePtr;
typedef boost::shared_ptr< ::unitree_legged_msgs::HighState const> HighStateConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::unitree_legged_msgs::HighState_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::unitree_legged_msgs::HighState_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::unitree_legged_msgs::HighState_<ContainerAllocator1> & lhs, const ::unitree_legged_msgs::HighState_<ContainerAllocator2> & rhs)
{
  return lhs.head == rhs.head &&
    lhs.levelFlag == rhs.levelFlag &&
    lhs.frameReserve == rhs.frameReserve &&
    lhs.SN == rhs.SN &&
    lhs.version == rhs.version &&
    lhs.bandWidth == rhs.bandWidth &&
    lhs.imu == rhs.imu &&
    lhs.motorState == rhs.motorState &&
    lhs.bms == rhs.bms &&
    lhs.footForce == rhs.footForce &&
    lhs.footForceEst == rhs.footForceEst &&
    lhs.mode == rhs.mode &&
    lhs.progress == rhs.progress &&
    lhs.gaitType == rhs.gaitType &&
    lhs.footRaiseHeight == rhs.footRaiseHeight &&
    lhs.position == rhs.position &&
    lhs.bodyHeight == rhs.bodyHeight &&
    lhs.velocity == rhs.velocity &&
    lhs.yawSpeed == rhs.yawSpeed &&
    lhs.rangeObstacle == rhs.rangeObstacle &&
    lhs.footPosition2Body == rhs.footPosition2Body &&
    lhs.footSpeed2Body == rhs.footSpeed2Body &&
    lhs.wirelessRemote == rhs.wirelessRemote &&
    lhs.reserve == rhs.reserve &&
    lhs.crc == rhs.crc;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::unitree_legged_msgs::HighState_<ContainerAllocator1> & lhs, const ::unitree_legged_msgs::HighState_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace unitree_legged_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::unitree_legged_msgs::HighState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::unitree_legged_msgs::HighState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::unitree_legged_msgs::HighState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::unitree_legged_msgs::HighState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::unitree_legged_msgs::HighState_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::unitree_legged_msgs::HighState_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::unitree_legged_msgs::HighState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "7904f43019dadf7640d573b4c14b9066";
  }

  static const char* value(const ::unitree_legged_msgs::HighState_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x7904f43019dadf76ULL;
  static const uint64_t static_value2 = 0x40d573b4c14b9066ULL;
};

template<class ContainerAllocator>
struct DataType< ::unitree_legged_msgs::HighState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "unitree_legged_msgs/HighState";
  }

  static const char* value(const ::unitree_legged_msgs::HighState_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::unitree_legged_msgs::HighState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
"uint8[2] head\n"
"uint8 levelFlag\n"
"uint8 frameReserve\n"
"\n"
"uint32[2] SN\n"
"uint32[2] version\n"
"uint16 bandWidth\n"
"IMU imu\n"
"MotorState[20] motorState\n"
"BmsState bms\n"
"int16[4] footForce\n"
"int16[4] footForceEst\n"
"uint8 mode\n"
"float32 progress\n"
"uint8 gaitType		   \n"
"float32 footRaiseHeight		  \n"
"float32[3] position \n"
"float32 bodyHeight			  \n"
"float32[3] velocity \n"
"float32 yawSpeed				   \n"
"float32[4] rangeObstacle\n"
"Cartesian[4] footPosition2Body \n"
"Cartesian[4] footSpeed2Body	\n"
"uint8[40] wirelessRemote\n"
"uint32 reserve\n"
"\n"
"uint32 crc\n"
"================================================================================\n"
"MSG: unitree_legged_msgs/IMU\n"
"float32[4] quaternion\n"
"float32[3] gyroscope\n"
"float32[3] accelerometer\n"
"float32[3] rpy\n"
"int8 temperature\n"
"================================================================================\n"
"MSG: unitree_legged_msgs/MotorState\n"
"uint8 mode           # motor current mode \n"
"float32 q            # motor current position（rad）\n"
"float32 dq           # motor current speed（rad/s）\n"
"float32 ddq          # motor current speed（rad/s）\n"
"float32 tauEst       # current estimated output torque（N*m）\n"
"float32 q_raw        # motor current position（rad）\n"
"float32 dq_raw       # motor current speed（rad/s）\n"
"float32 ddq_raw      # motor current speed（rad/s）\n"
"int8 temperature     # motor temperature（slow conduction of temperature leads to lag）\n"
"uint32[2] reserve\n"
"================================================================================\n"
"MSG: unitree_legged_msgs/BmsState\n"
"uint8 version_h\n"
"uint8 version_l\n"
"uint8 bms_status\n"
"uint8 SOC                  # SOC 0-100%\n"
"int32 current              # mA\n"
"uint16 cycle\n"
"int8[2] BQ_NTC             # x1 degrees centigrade\n"
"int8[2] MCU_NTC            # x1 degrees centigrade\n"
"uint16[10] cell_vol        # cell voltage mV\n"
"================================================================================\n"
"MSG: unitree_legged_msgs/Cartesian\n"
"float32 x\n"
"float32 y\n"
"float32 z\n"
;
  }

  static const char* value(const ::unitree_legged_msgs::HighState_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::unitree_legged_msgs::HighState_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.head);
      stream.next(m.levelFlag);
      stream.next(m.frameReserve);
      stream.next(m.SN);
      stream.next(m.version);
      stream.next(m.bandWidth);
      stream.next(m.imu);
      stream.next(m.motorState);
      stream.next(m.bms);
      stream.next(m.footForce);
      stream.next(m.footForceEst);
      stream.next(m.mode);
      stream.next(m.progress);
      stream.next(m.gaitType);
      stream.next(m.footRaiseHeight);
      stream.next(m.position);
      stream.next(m.bodyHeight);
      stream.next(m.velocity);
      stream.next(m.yawSpeed);
      stream.next(m.rangeObstacle);
      stream.next(m.footPosition2Body);
      stream.next(m.footSpeed2Body);
      stream.next(m.wirelessRemote);
      stream.next(m.reserve);
      stream.next(m.crc);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct HighState_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::unitree_legged_msgs::HighState_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::unitree_legged_msgs::HighState_<ContainerAllocator>& v)
  {
    s << indent << "head[]" << std::endl;
    for (size_t i = 0; i < v.head.size(); ++i)
    {
      s << indent << "  head[" << i << "]: ";
      Printer<uint8_t>::stream(s, indent + "  ", v.head[i]);
    }
    s << indent << "levelFlag: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.levelFlag);
    s << indent << "frameReserve: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.frameReserve);
    s << indent << "SN[]" << std::endl;
    for (size_t i = 0; i < v.SN.size(); ++i)
    {
      s << indent << "  SN[" << i << "]: ";
      Printer<uint32_t>::stream(s, indent + "  ", v.SN[i]);
    }
    s << indent << "version[]" << std::endl;
    for (size_t i = 0; i < v.version.size(); ++i)
    {
      s << indent << "  version[" << i << "]: ";
      Printer<uint32_t>::stream(s, indent + "  ", v.version[i]);
    }
    s << indent << "bandWidth: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.bandWidth);
    s << indent << "imu: ";
    s << std::endl;
    Printer< ::unitree_legged_msgs::IMU_<ContainerAllocator> >::stream(s, indent + "  ", v.imu);
    s << indent << "motorState[]" << std::endl;
    for (size_t i = 0; i < v.motorState.size(); ++i)
    {
      s << indent << "  motorState[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::unitree_legged_msgs::MotorState_<ContainerAllocator> >::stream(s, indent + "    ", v.motorState[i]);
    }
    s << indent << "bms: ";
    s << std::endl;
    Printer< ::unitree_legged_msgs::BmsState_<ContainerAllocator> >::stream(s, indent + "  ", v.bms);
    s << indent << "footForce[]" << std::endl;
    for (size_t i = 0; i < v.footForce.size(); ++i)
    {
      s << indent << "  footForce[" << i << "]: ";
      Printer<int16_t>::stream(s, indent + "  ", v.footForce[i]);
    }
    s << indent << "footForceEst[]" << std::endl;
    for (size_t i = 0; i < v.footForceEst.size(); ++i)
    {
      s << indent << "  footForceEst[" << i << "]: ";
      Printer<int16_t>::stream(s, indent + "  ", v.footForceEst[i]);
    }
    s << indent << "mode: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.mode);
    s << indent << "progress: ";
    Printer<float>::stream(s, indent + "  ", v.progress);
    s << indent << "gaitType: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.gaitType);
    s << indent << "footRaiseHeight: ";
    Printer<float>::stream(s, indent + "  ", v.footRaiseHeight);
    s << indent << "position[]" << std::endl;
    for (size_t i = 0; i < v.position.size(); ++i)
    {
      s << indent << "  position[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.position[i]);
    }
    s << indent << "bodyHeight: ";
    Printer<float>::stream(s, indent + "  ", v.bodyHeight);
    s << indent << "velocity[]" << std::endl;
    for (size_t i = 0; i < v.velocity.size(); ++i)
    {
      s << indent << "  velocity[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.velocity[i]);
    }
    s << indent << "yawSpeed: ";
    Printer<float>::stream(s, indent + "  ", v.yawSpeed);
    s << indent << "rangeObstacle[]" << std::endl;
    for (size_t i = 0; i < v.rangeObstacle.size(); ++i)
    {
      s << indent << "  rangeObstacle[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.rangeObstacle[i]);
    }
    s << indent << "footPosition2Body[]" << std::endl;
    for (size_t i = 0; i < v.footPosition2Body.size(); ++i)
    {
      s << indent << "  footPosition2Body[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::unitree_legged_msgs::Cartesian_<ContainerAllocator> >::stream(s, indent + "    ", v.footPosition2Body[i]);
    }
    s << indent << "footSpeed2Body[]" << std::endl;
    for (size_t i = 0; i < v.footSpeed2Body.size(); ++i)
    {
      s << indent << "  footSpeed2Body[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::unitree_legged_msgs::Cartesian_<ContainerAllocator> >::stream(s, indent + "    ", v.footSpeed2Body[i]);
    }
    s << indent << "wirelessRemote[]" << std::endl;
    for (size_t i = 0; i < v.wirelessRemote.size(); ++i)
    {
      s << indent << "  wirelessRemote[" << i << "]: ";
      Printer<uint8_t>::stream(s, indent + "  ", v.wirelessRemote[i]);
    }
    s << indent << "reserve: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.reserve);
    s << indent << "crc: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.crc);
  }
};

} // namespace message_operations
} // namespace ros

#endif // UNITREE_LEGGED_MSGS_MESSAGE_HIGHSTATE_H