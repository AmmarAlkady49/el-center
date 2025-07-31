import 'package:json_annotation/json_annotation.dart';

part 'completed_lesson_model.g.dart';

@JsonSerializable()
class CompletedLessonModel {
  final int lessonId;
  final int enrollmentId;
  final String completedDate;

  CompletedLessonModel(
      {required this.lessonId,
      required this.enrollmentId,
      required this.completedDate});

  factory CompletedLessonModel.fromJson(Map<String, dynamic> json) =>
      _$CompletedLessonModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompletedLessonModelToJson(this);
}
