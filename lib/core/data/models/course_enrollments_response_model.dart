import 'package:json_annotation/json_annotation.dart';

part 'course_enrollments_response_model.g.dart';

@JsonSerializable()
class CourseEnrollmentsResponseModel {
  final int id;
  final String status;
  final int progress;
  final int courseId;
  final String courseTitle;

  CourseEnrollmentsResponseModel(
      {required this.id,
      required this.status,
      required this.progress,
      required this.courseId,
      required this.courseTitle});

  factory CourseEnrollmentsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseEnrollmentsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseEnrollmentsResponseModelToJson(this);
}
