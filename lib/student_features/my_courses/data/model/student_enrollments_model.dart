import 'package:json_annotation/json_annotation.dart';

part 'student_enrollments_model.g.dart';

@JsonSerializable()
class StudentEnrollmentsModel {
  final int id;
  final String status;
  final double progress;
  final int courseId;
  final String courseTitle;

  StudentEnrollmentsModel(
      {required this.id,
      required this.status,
      required this.progress,
      required this.courseId,
      required this.courseTitle});

  factory StudentEnrollmentsModel.fromJson(Map<String, dynamic> json) =>
      _$StudentEnrollmentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudentEnrollmentsModelToJson(this);
}
