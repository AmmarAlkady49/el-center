// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_module_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModuleModel _$CourseModuleModelFromJson(Map<String, dynamic> json) =>
    CourseModuleModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      orderIndex: (json['orderIndex'] as num?)?.toInt(),
      isPublished: json['isPublished'] as bool?,
      courseId: (json['courseId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CourseModuleModelToJson(CourseModuleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'orderIndex': instance.orderIndex,
      'isPublished': instance.isPublished,
      'courseId': instance.courseId,
    };
