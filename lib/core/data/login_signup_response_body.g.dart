// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_signup_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginSignupResponseBody _$LoginSignupResponseBodyFromJson(
        Map<String, dynamic> json) =>
    LoginSignupResponseBody(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$LoginSignupResponseBodyToJson(
        LoginSignupResponseBody instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
