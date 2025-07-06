// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_account_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveAccountRequestBody _$ActiveAccountRequestBodyFromJson(
        Map<String, dynamic> json) =>
    ActiveAccountRequestBody(
      email: json['email'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$ActiveAccountRequestBodyToJson(
        ActiveAccountRequestBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
    };
