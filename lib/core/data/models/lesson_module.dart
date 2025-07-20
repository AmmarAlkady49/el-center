import 'package:json_annotation/json_annotation.dart';

part 'lesson_module.g.dart';

@JsonSerializable()
class LessonModule {
  final int id;
  final int? orderIndex;
  final int? moduleId;
  final String? title;
  final String? content;
  final String? contentType;
  final int? durationInMinutes;
  final String? description;
  final bool? isPublished;

  LessonModule(
      {required this.id,
      required this.orderIndex,
      required this.moduleId,
      required this.title,
      required this.content,
      required this.contentType,
      required this.durationInMinutes,
      required this.description,
      required this.isPublished});

  factory LessonModule.fromJson(Map<String, dynamic> json) =>
      _$LessonModuleFromJson(json);

  Map<String, dynamic> toJson() => _$LessonModuleToJson(this);
}
