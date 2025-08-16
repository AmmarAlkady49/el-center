// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_account_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveAccountResponseBody _$ActiveAccountResponseBodyFromJson(
        Map<String, dynamic> json) =>
    ActiveAccountResponseBody(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$ActiveAccountResponseBodyToJson(
        ActiveAccountResponseBody instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
