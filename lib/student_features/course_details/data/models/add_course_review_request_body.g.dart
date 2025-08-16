// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_course_review_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCourseReviewRequestBody _$AddCourseReviewRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AddCourseReviewRequestBody(
      courseId: (json['courseId'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      reviewContent: json['reviewContent'] as String,
    );

Map<String, dynamic> _$AddCourseReviewRequestBodyToJson(
        AddCourseReviewRequestBody instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'rating': instance.rating,
      'reviewContent': instance.reviewContent,
    };
