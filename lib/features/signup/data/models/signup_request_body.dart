
import 'package:json_annotation/json_annotation.dart';


part 'signup_request_body.g.dart';
@JsonSerializable()
class SignupRequestBody {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumber;
  final String gender;
  final String dateOfBirth;
  final String userType;

  SignupRequestBody(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.phoneNumber,
      required this.gender,
      required this.dateOfBirth,
      required this.userType});

  factory SignupRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
