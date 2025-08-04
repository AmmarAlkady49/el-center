import 'package:json_annotation/json_annotation.dart';

part 'question_model_for_q_and_a.g.dart';

@JsonSerializable(checked: true)
class QuestionModelForQAndA {
  final int id;
  final String question;
  final String createdAt;
  final String createdById;
  final String createdByName;
  final String creatorImage;
  final bool isInstructor;
  final bool isEdited;
  final String? editedAt;
  final bool isPinned;
  final int lessonId;
  final int helpfulCount;

  QuestionModelForQAndA(
      {required this.id,
      required this.question,
      required this.createdAt,
      required this.createdById,
      required this.createdByName,
      required this.creatorImage,
      required this.isInstructor,
      required this.isEdited,
      required this.editedAt,
      required this.isPinned,
      required this.lessonId,
      required this.helpfulCount});

  factory QuestionModelForQAndA.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelForQAndAFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelForQAndAToJson(this);
}
