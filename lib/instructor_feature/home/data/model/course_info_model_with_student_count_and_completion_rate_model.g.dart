// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_info_model_with_student_count_and_completion_rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseInfoModelWithStudentCountAndCompletionRateModel
    _$CourseInfoModelWithStudentCountAndCompletionRateModelFromJson(
            Map<String, dynamic> json) =>
        CourseInfoModelWithStudentCountAndCompletionRateModel(
          courseInfoModel: CourseInfoModel.fromJson(
              json['courseInfoModel'] as Map<String, dynamic>),
          studentCount: (json['studentCount'] as num).toInt(),
          completionRate: (json['completionRate'] as num).toDouble(),
        );

Map<String, dynamic>
    _$CourseInfoModelWithStudentCountAndCompletionRateModelToJson(
            CourseInfoModelWithStudentCountAndCompletionRateModel instance) =>
        <String, dynamic>{
          'courseInfoModel': instance.courseInfoModel,
          'studentCount': instance.studentCount,
          'completionRate': instance.completionRate,
        };
