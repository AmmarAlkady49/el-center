// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_enrollments_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseEnrollmentsResponseModel _$CourseEnrollmentsResponseModelFromJson(
        Map<String, dynamic> json) =>
    CourseEnrollmentsResponseModel(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String,
      progress: (json['progress'] as num).toInt(),
      courseId: (json['courseId'] as num).toInt(),
      courseTitle: json['courseTitle'] as String,
    );

Map<String, dynamic> _$CourseEnrollmentsResponseModelToJson(
        CourseEnrollmentsResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'progress': instance.progress,
      'courseId': instance.courseId,
      'courseTitle': instance.courseTitle,
    };
