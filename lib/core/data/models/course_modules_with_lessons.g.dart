// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_modules_with_lessons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModulesWithLessons _$CourseModulesWithLessonsFromJson(
        Map<String, dynamic> json) =>
    CourseModulesWithLessons(
      courseModules: CourseModuleModel.fromJson(
          json['courseModules'] as Map<String, dynamic>),
      lessons: (json['lessons'] as List<dynamic>)
          .map((e) => LessonModule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseModulesWithLessonsToJson(
        CourseModulesWithLessons instance) =>
    <String, dynamic>{
      'courseModules': instance.courseModules,
      'lessons': instance.lessons,
    };
