import 'package:e_learning_app/core/data/models/course_info_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_info_model_with_student_count_and_completion_rate_model.g.dart';

@JsonSerializable()
class CourseInfoModelWithStudentCountAndCompletionRateModel {
  final CourseInfoModel courseInfoModel;
  final int studentCount;
  final double completionRate;

  CourseInfoModelWithStudentCountAndCompletionRateModel(
      {required this.courseInfoModel,
      required this.studentCount,
      required this.completionRate});

  factory CourseInfoModelWithStudentCountAndCompletionRateModel.fromJson(
          Map<String, dynamic> json) =>
      _$CourseInfoModelWithStudentCountAndCompletionRateModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CourseInfoModelWithStudentCountAndCompletionRateModelToJson(this);
}
