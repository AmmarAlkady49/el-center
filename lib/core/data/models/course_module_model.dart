import 'package:json_annotation/json_annotation.dart';

part 'course_module_model.g.dart';

@JsonSerializable()
class CourseModuleModel {
  final int id;
  final String? title;
  final String? description;
  final int? orderIndex;
  final bool? isPublished;
  final int? courseId;

  CourseModuleModel({
    required this.id,
    required this.title,
    required this.description,
    required this.orderIndex,
    required this.isPublished,
    required this.courseId,
  });

  factory CourseModuleModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModuleModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseModuleModelToJson(this);
}
