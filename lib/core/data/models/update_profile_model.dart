import 'package:json_annotation/json_annotation.dart';

part 'update_profile_model.g.dart';

@JsonSerializable(checked: true)
class UpdateProfileModel {
  @JsonKey(name: 'FirstName')
  final String firstName;
  @JsonKey(name: 'LastName')
  final String lastName;
  @JsonKey(name: 'PhoneNumber')
  final String phoneNumber;
  @JsonKey(name: 'Gender')
  final String gender;
  @JsonKey(name: 'DateOfBirth')
  final String dateOfBirth;
  @JsonKey(name: 'Bio')
  final String bio;
  @JsonKey(name: 'ProfilePicture')
  final String profilePicture;
  @JsonKey(name: 'Country')
  final String country;

  UpdateProfileModel(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.gender,
      required this.dateOfBirth,
      required this.bio,
      required this.profilePicture,
      required this.country});

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileModelToJson(this);
}
