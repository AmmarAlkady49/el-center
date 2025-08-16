// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseInfoModel _$CourseInfoModelFromJson(Map<String, dynamic> json) =>
    CourseInfoModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      requirements: json['requirements'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      thumbnail: json['thumbnail'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isActive: json['isActive'] as bool?,
      durationInHours: (json['durationInHours'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
      instructorId: json['instructorId'] as String?,
      instructorName: json['instructorName'] as String?,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      categoryName: json['categoryName'] as String?,
      courseStatus: json['courseStatus'] as String?,
      instructorImage: json['instructorImage'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      useAIAssistant: json['useAIAssistant'] as bool?,
      courseLanguage: json['courseLanguage'] as String?,
    );

Map<String, dynamic> _$CourseInfoModelToJson(CourseInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'requirements': instance.requirements,
      'price': instance.price,
      'thumbnail': instance.thumbnail,
      'createdAt': instance.createdAt?.toIso8601String(),
      'isActive': instance.isActive,
      'durationInHours': instance.durationInHours,
      'rating': instance.rating,
      'instructorId': instance.instructorId,
      'instructorName': instance.instructorName,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'courseStatus': instance.courseStatus,
      'instructorImage': instance.instructorImage,
      'isDeleted': instance.isDeleted,
      'useAIAssistant': instance.useAIAssistant,
      'courseLanguage': instance.courseLanguage,
    };
