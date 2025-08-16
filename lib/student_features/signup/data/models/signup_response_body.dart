

import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_response_body.g.dart';

@JsonSerializable()
class SignupResponseBody {
  final int statusCode;
  final String message;

  SignupResponseBody({required this.statusCode, required this.message});

  factory SignupResponseBody.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseBodyFromJson(json);

  
}