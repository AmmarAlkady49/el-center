// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_model_for_q_and_a.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerModelForQAndA _$AnswerModelForQAndAFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AnswerModelForQAndA',
      json,
      ($checkedConvert) {
        final val = AnswerModelForQAndA(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          answer: $checkedConvert('answer', (v) => v as String),
          createdAt: $checkedConvert('createdAt', (v) => v as String),
          createdById: $checkedConvert('createdById', (v) => v as String),
          createdByName: $checkedConvert('createdByName', (v) => v as String),
          creatorImage: $checkedConvert('creatorImage', (v) => v as String),
          isInstructor: $checkedConvert('isInstructor', (v) => v as bool),
          isEdited: $checkedConvert('isEdited', (v) => v as bool),
          editedAt: $checkedConvert('editedAt', (v) => v as String?),
          questionId: $checkedConvert('questionId', (v) => (v as num).toInt()),
          helpfulCount:
              $checkedConvert('helpfulCount', (v) => (v as num).toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$AnswerModelForQAndAToJson(
        AnswerModelForQAndA instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
      'createdAt': instance.createdAt,
      'createdById': instance.createdById,
      'createdByName': instance.createdByName,
      'creatorImage': instance.creatorImage,
      'isInstructor': instance.isInstructor,
      'isEdited': instance.isEdited,
      'editedAt': instance.editedAt,
      'questionId': instance.questionId,
      'helpfulCount': instance.helpfulCount,
    };
