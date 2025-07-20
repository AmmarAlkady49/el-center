import 'package:json_annotation/json_annotation.dart';

part 'course_review_model.g.dart';

@JsonSerializable()
class CourseReviewModel {
  final String studentId;
  final String studentName;
  final String? studentImage;
  final int id;
  final int rating;
  final String reviewContent;
  final String createdAt;
  final int count;

  CourseReviewModel({
    required this.studentId,
    required this.studentName,
    this.studentImage,
    required this.id,
    required this.rating,
    required this.reviewContent,
    required this.createdAt,
    required this.count,
  });

  factory CourseReviewModel.fromJson(Map<String, dynamic> json) =>
      _$CourseReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseReviewModelToJson(this);
}
