import 'package:json_annotation/json_annotation.dart';

part 'answer_model_for_q_and_a.g.dart';

@JsonSerializable(checked: true)
class AnswerModelForQAndA {
  final int id;
  final String answer;
  final String createdAt;
  final String createdById;
  final String createdByName;
  final String creatorImage;
  final bool isInstructor;
  final bool isEdited;
  final String? editedAt;
  final int questionId;
  final int helpfulCount;

  AnswerModelForQAndA(
      {required this.id,
      required this.answer,
      required this.createdAt,
      required this.createdById,
      required this.createdByName,
      required this.creatorImage,
      required this.isInstructor,
      required this.isEdited,
      required this.editedAt,
      required this.questionId,
      required this.helpfulCount});

  factory AnswerModelForQAndA.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelForQAndAFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelForQAndAToJson(this);
}
