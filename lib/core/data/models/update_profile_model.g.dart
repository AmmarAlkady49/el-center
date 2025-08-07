// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileModel _$UpdateProfileModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'UpdateProfileModel',
      json,
      ($checkedConvert) {
        final val = UpdateProfileModel(
          firstName: $checkedConvert('FirstName', (v) => v as String),
          lastName: $checkedConvert('LastName', (v) => v as String),
          phoneNumber: $checkedConvert('PhoneNumber', (v) => v as String),
          gender: $checkedConvert('Gender', (v) => v as String),
          dateOfBirth: $checkedConvert('DateOfBirth', (v) => v as String),
          bio: $checkedConvert('Bio', (v) => v as String),
          profilePicture: $checkedConvert('ProfilePicture', (v) => v as String),
          country: $checkedConvert('Country', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'firstName': 'FirstName',
        'lastName': 'LastName',
        'phoneNumber': 'PhoneNumber',
        'gender': 'Gender',
        'dateOfBirth': 'DateOfBirth',
        'bio': 'Bio',
        'profilePicture': 'ProfilePicture',
        'country': 'Country'
      },
    );

Map<String, dynamic> _$UpdateProfileModelToJson(UpdateProfileModel instance) =>
    <String, dynamic>{
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'PhoneNumber': instance.phoneNumber,
      'Gender': instance.gender,
      'DateOfBirth': instance.dateOfBirth,
      'Bio': instance.bio,
      'ProfilePicture': instance.profilePicture,
      'Country': instance.country,
    };
