import 'package:json_annotation/json_annotation.dart';

part 'add_course_review_request_body.g.dart';

@JsonSerializable()
class AddCourseReviewRequestBody {
  final int courseId;
  final int rating;
  final String reviewContent;

  AddCourseReviewRequestBody(
      {required this.courseId,
      required this.rating,
      required this.reviewContent});

  factory AddCourseReviewRequestBody.fromJson(Map<String, dynamic> json) =>
      _$AddCourseReviewRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AddCourseReviewRequestBodyToJson(this);
}
