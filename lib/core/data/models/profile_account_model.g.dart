// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileAccountModel _$ProfileAccountModelFromJson(Map<String, dynamic> json) =>
    ProfileAccountModel(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      gender: json['gender'] as String,
      userType: json['userType'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      bio: json['bio'] as String?,
      profilePicture: json['profilePicture'] as String?,
      isActive: json['isActive'] as bool,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ProfileAccountModelToJson(
        ProfileAccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'gender': instance.gender,
      'userType': instance.userType,
      'dateOfBirth': instance.dateOfBirth,
      'bio': instance.bio,
      'profilePicture': instance.profilePicture,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt,
    };
