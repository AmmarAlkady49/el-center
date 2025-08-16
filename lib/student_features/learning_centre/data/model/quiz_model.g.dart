// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) => QuizModel(
      id: (json['id'] as num).toInt(),
      question: json['question'] as String,
      optionA: json['optionA'] as String,
      optionB: json['optionB'] as String,
      optionC: json['optionC'] as String,
      optionD: json['optionD'] as String,
      correctAnswer: json['correctAnswer'] as String,
      explanation: json['explanation'] as String,
      courseId: (json['courseId'] as num).toInt(),
      lessonId: (json['lessonId'] as num).toInt(),
    );

Map<String, dynamic> _$QuizModelToJson(QuizModel instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'optionA': instance.optionA,
      'optionB': instance.optionB,
      'optionC': instance.optionC,
      'optionD': instance.optionD,
      'correctAnswer': instance.correctAnswer,
      'explanation': instance.explanation,
      'courseId': instance.courseId,
      'lessonId': instance.lessonId,
    };
