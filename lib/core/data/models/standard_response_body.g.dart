// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standard_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StandardResponseBody _$StandardResponseBodyFromJson(
        Map<String, dynamic> json) =>
    StandardResponseBody(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$StandardResponseBodyToJson(
        StandardResponseBody instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
