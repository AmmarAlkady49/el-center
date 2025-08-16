// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updata_course_review_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCourseReviewRequestBody _$UpdateCourseReviewRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateCourseReviewRequestBody(
      id: (json['id'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      reviewContent: json['reviewContent'] as String,
    );

Map<String, dynamic> _$UpdateCourseReviewRequestBodyToJson(
        UpdateCourseReviewRequestBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'reviewContent': instance.reviewContent,
    };
