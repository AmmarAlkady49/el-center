// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_enrollments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentEnrollmentsModel _$StudentEnrollmentsModelFromJson(
        Map<String, dynamic> json) =>
    StudentEnrollmentsModel(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String,
      progress: (json['progress'] as num).toDouble(),
      courseId: (json['courseId'] as num).toInt(),
      courseTitle: json['courseTitle'] as String,
    );

Map<String, dynamic> _$StudentEnrollmentsModelToJson(
        StudentEnrollmentsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'progress': instance.progress,
      'courseId': instance.courseId,
      'courseTitle': instance.courseTitle,
    };
