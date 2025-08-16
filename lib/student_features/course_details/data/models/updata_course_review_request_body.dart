import 'package:json_annotation/json_annotation.dart';

part 'updata_course_review_request_body.g.dart';

@JsonSerializable()
class UpdateCourseReviewRequestBody {
  final int id;
  final int rating;
  final String reviewContent;

  UpdateCourseReviewRequestBody(
      {required this.id, required this.rating, required this.reviewContent});

  factory UpdateCourseReviewRequestBody.fromJson(Map<String, dynamic> json) =>
      _$UpdateCourseReviewRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCourseReviewRequestBodyToJson(this);
}
