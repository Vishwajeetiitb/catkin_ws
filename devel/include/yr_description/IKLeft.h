// Generated by gencpp from file yr_description/IKLeft.msg
// DO NOT EDIT!


#ifndef YR_DESCRIPTION_MESSAGE_IKLEFT_H
#define YR_DESCRIPTION_MESSAGE_IKLEFT_H

#include <ros/service_traits.h>


#include <yr_description/IKLeftRequest.h>
#include <yr_description/IKLeftResponse.h>


namespace yr_description
{

struct IKLeft
{

typedef IKLeftRequest Request;
typedef IKLeftResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct IKLeft
} // namespace yr_description


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::yr_description::IKLeft > {
  static const char* value()
  {
    return "2d3149f50ac2299a08916bb78e0c6b8d";
  }

  static const char* value(const ::yr_description::IKLeft&) { return value(); }
};

template<>
struct DataType< ::yr_description::IKLeft > {
  static const char* value()
  {
    return "yr_description/IKLeft";
  }

  static const char* value(const ::yr_description::IKLeft&) { return value(); }
};


// service_traits::MD5Sum< ::yr_description::IKLeftRequest> should match
// service_traits::MD5Sum< ::yr_description::IKLeft >
template<>
struct MD5Sum< ::yr_description::IKLeftRequest>
{
  static const char* value()
  {
    return MD5Sum< ::yr_description::IKLeft >::value();
  }
  static const char* value(const ::yr_description::IKLeftRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::yr_description::IKLeftRequest> should match
// service_traits::DataType< ::yr_description::IKLeft >
template<>
struct DataType< ::yr_description::IKLeftRequest>
{
  static const char* value()
  {
    return DataType< ::yr_description::IKLeft >::value();
  }
  static const char* value(const ::yr_description::IKLeftRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::yr_description::IKLeftResponse> should match
// service_traits::MD5Sum< ::yr_description::IKLeft >
template<>
struct MD5Sum< ::yr_description::IKLeftResponse>
{
  static const char* value()
  {
    return MD5Sum< ::yr_description::IKLeft >::value();
  }
  static const char* value(const ::yr_description::IKLeftResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::yr_description::IKLeftResponse> should match
// service_traits::DataType< ::yr_description::IKLeft >
template<>
struct DataType< ::yr_description::IKLeftResponse>
{
  static const char* value()
  {
    return DataType< ::yr_description::IKLeft >::value();
  }
  static const char* value(const ::yr_description::IKLeftResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // YR_DESCRIPTION_MESSAGE_IKLEFT_H
