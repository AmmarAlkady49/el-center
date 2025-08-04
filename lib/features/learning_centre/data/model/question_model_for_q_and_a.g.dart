// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model_for_q_and_a.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModelForQAndA _$QuestionModelForQAndAFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'QuestionModelForQAndA',
      json,
      ($checkedConvert) {
        final val = QuestionModelForQAndA(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          question: $checkedConvert('question', (v) => v as String),
          createdAt: $checkedConvert('createdAt', (v) => v as String),
          createdById: $checkedConvert('createdById', (v) => v as String),
          createdByName: $checkedConvert('createdByName', (v) => v as String),
          creatorImage: $checkedConvert('creatorImage', (v) => v as String),
          isInstructor: $checkedConvert('isInstructor', (v) => v as bool),
          isEdited: $checkedConvert('isEdited', (v) => v as bool),
          editedAt: $checkedConvert('editedAt', (v) => v as String?),
          isPinned: $checkedConvert('isPinned', (v) => v as bool),
          lessonId: $checkedConvert('lessonId', (v) => (v as num).toInt()),
          helpfulCount:
              $checkedConvert('helpfulCount', (v) => (v as num).toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$QuestionModelForQAndAToJson(
        QuestionModelForQAndA instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'createdAt': instance.createdAt,
      'createdById': instance.createdById,
      'createdByName': instance.createdByName,
      'creatorImage': instance.creatorImage,
      'isInstructor': instance.isInstructor,
      'isEdited': instance.isEdited,
      'editedAt': instance.editedAt,
      'isPinned': instance.isPinned,
      'lessonId': instance.lessonId,
      'helpfulCount': instance.helpfulCount,
    };
