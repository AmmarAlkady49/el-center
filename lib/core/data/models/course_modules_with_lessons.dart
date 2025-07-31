import 'package:json_annotation/json_annotation.dart';

import 'course_module_model.dart';
import 'lesson_module.dart';

part 'course_modules_with_lessons.g.dart';

@JsonSerializable()
class CourseModulesWithLessons {
  final CourseModuleModel courseModules;
  final List<LessonModule> lessons;

  CourseModulesWithLessons(
      {required this.courseModules, required this.lessons});

  factory CourseModulesWithLessons.fromJson(Map<String, dynamic> json) =>
      _$CourseModulesWithLessonsFromJson(json);

  Map<String, dynamic> toJson() => _$CourseModulesWithLessonsToJson(this);
}
