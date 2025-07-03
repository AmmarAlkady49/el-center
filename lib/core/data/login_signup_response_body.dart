import 'package:json_annotation/json_annotation.dart';

part 'login_signup_response_body.g.dart';


@JsonSerializable()
class LoginSignupResponseBody {
  final int statusCode;
  final String message;

  LoginSignupResponseBody({
    required this.statusCode,
    required this.message,
  });

  factory LoginSignupResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginSignupResponseBodyFromJson(json);
}