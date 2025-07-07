import 'package:json_annotation/json_annotation.dart';

part 'profile_account_model.g.dart';

@JsonSerializable()
class ProfileAccountModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String gender;
  final String userType;
  final String dateOfBirth;
  final String? bio;
  final String? profilePicture;
  final bool isActive;
  final String createdAt;

  ProfileAccountModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.gender,
      required this.userType,
      required this.dateOfBirth,
      this.bio,
      this.profilePicture,
      required this.isActive,
      required this.createdAt});

  factory ProfileAccountModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileAccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileAccountModelToJson(this);
}
