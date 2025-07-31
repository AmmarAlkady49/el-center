// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_lesson_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedLessonModel _$CompletedLessonModelFromJson(
        Map<String, dynamic> json) =>
    CompletedLessonModel(
      lessonId: (json['lessonId'] as num).toInt(),
      enrollmentId: (json['enrollmentId'] as num).toInt(),
      completedDate: json['completedDate'] as String,
    );

Map<String, dynamic> _$CompletedLessonModelToJson(
        CompletedLessonModel instance) =>
    <String, dynamic>{
      'lessonId': instance.lessonId,
      'enrollmentId': instance.enrollmentId,
      'completedDate': instance.completedDate,
    };
