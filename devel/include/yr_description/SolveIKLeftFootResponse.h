// Generated by gencpp from file yr_description/SolveIKLeftFootResponse.msg
// DO NOT EDIT!


#ifndef YR_DESCRIPTION_MESSAGE_SOLVEIKLEFTFOOTRESPONSE_H
#define YR_DESCRIPTION_MESSAGE_SOLVEIKLEFTFOOTRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace yr_description
{
template <class ContainerAllocator>
struct SolveIKLeftFootResponse_
{
  typedef SolveIKLeftFootResponse_<ContainerAllocator> Type;

  SolveIKLeftFootResponse_()
    : joint_angles()  {
    }
  SolveIKLeftFootResponse_(const ContainerAllocator& _alloc)
    : joint_angles(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<double, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<double>> _joint_angles_type;
  _joint_angles_type joint_angles;





  typedef boost::shared_ptr< ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator> const> ConstPtr;

}; // struct SolveIKLeftFootResponse_

typedef ::yr_description::SolveIKLeftFootResponse_<std::allocator<void> > SolveIKLeftFootResponse;

typedef boost::shared_ptr< ::yr_description::SolveIKLeftFootResponse > SolveIKLeftFootResponsePtr;
typedef boost::shared_ptr< ::yr_description::SolveIKLeftFootResponse const> SolveIKLeftFootResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator1> & lhs, const ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator2> & rhs)
{
  return lhs.joint_angles == rhs.joint_angles;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator1> & lhs, const ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace yr_description

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9eebf9cc7d525d143ad033b65dacb648";
  }

  static const char* value(const ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9eebf9cc7d525d14ULL;
  static const uint64_t static_value2 = 0x3ad033b65dacb648ULL;
};

template<class ContainerAllocator>
struct DataType< ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "yr_description/SolveIKLeftFootResponse";
  }

  static const char* value(const ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Response part\n"
"float64[] joint_angles\n"
;
  }

  static const char* value(const ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.joint_angles);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SolveIKLeftFootResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::yr_description::SolveIKLeftFootResponse_<ContainerAllocator>& v)
  {
    s << indent << "joint_angles[]" << std::endl;
    for (size_t i = 0; i < v.joint_angles.size(); ++i)
    {
      s << indent << "  joint_angles[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.joint_angles[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // YR_DESCRIPTION_MESSAGE_SOLVEIKLEFTFOOTRESPONSE_H
