// Generated by gencpp from file yr_description/SolveIKLeftFoot.msg
// DO NOT EDIT!


#ifndef YR_DESCRIPTION_MESSAGE_SOLVEIKLEFTFOOT_H
#define YR_DESCRIPTION_MESSAGE_SOLVEIKLEFTFOOT_H

#include <ros/service_traits.h>


#include <yr_description/SolveIKLeftFootRequest.h>
#include <yr_description/SolveIKLeftFootResponse.h>


namespace yr_description
{

struct SolveIKLeftFoot
{

typedef SolveIKLeftFootRequest Request;
typedef SolveIKLeftFootResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SolveIKLeftFoot
} // namespace yr_description


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::yr_description::SolveIKLeftFoot > {
  static const char* value()
  {
    return "2d3149f50ac2299a08916bb78e0c6b8d";
  }

  static const char* value(const ::yr_description::SolveIKLeftFoot&) { return value(); }
};

template<>
struct DataType< ::yr_description::SolveIKLeftFoot > {
  static const char* value()
  {
    return "yr_description/SolveIKLeftFoot";
  }

  static const char* value(const ::yr_description::SolveIKLeftFoot&) { return value(); }
};


// service_traits::MD5Sum< ::yr_description::SolveIKLeftFootRequest> should match
// service_traits::MD5Sum< ::yr_description::SolveIKLeftFoot >
template<>
struct MD5Sum< ::yr_description::SolveIKLeftFootRequest>
{
  static const char* value()
  {
    return MD5Sum< ::yr_description::SolveIKLeftFoot >::value();
  }
  static const char* value(const ::yr_description::SolveIKLeftFootRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::yr_description::SolveIKLeftFootRequest> should match
// service_traits::DataType< ::yr_description::SolveIKLeftFoot >
template<>
struct DataType< ::yr_description::SolveIKLeftFootRequest>
{
  static const char* value()
  {
    return DataType< ::yr_description::SolveIKLeftFoot >::value();
  }
  static const char* value(const ::yr_description::SolveIKLeftFootRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::yr_description::SolveIKLeftFootResponse> should match
// service_traits::MD5Sum< ::yr_description::SolveIKLeftFoot >
template<>
struct MD5Sum< ::yr_description::SolveIKLeftFootResponse>
{
  static const char* value()
  {
    return MD5Sum< ::yr_description::SolveIKLeftFoot >::value();
  }
  static const char* value(const ::yr_description::SolveIKLeftFootResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::yr_description::SolveIKLeftFootResponse> should match
// service_traits::DataType< ::yr_description::SolveIKLeftFoot >
template<>
struct DataType< ::yr_description::SolveIKLeftFootResponse>
{
  static const char* value()
  {
    return DataType< ::yr_description::SolveIKLeftFoot >::value();
  }
  static const char* value(const ::yr_description::SolveIKLeftFootResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // YR_DESCRIPTION_MESSAGE_SOLVEIKLEFTFOOT_H