// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseReviewModel _$CourseReviewModelFromJson(Map<String, dynamic> json) =>
    CourseReviewModel(
      studentId: json['studentId'] as String,
      studentName: json['studentName'] as String,
      studentImage: json['studentImage'] as String?,
      id: (json['id'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      reviewContent: json['reviewContent'] as String,
      createdAt: json['createdAt'] as String,
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$CourseReviewModelToJson(CourseReviewModel instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'studentName': instance.studentName,
      'studentImage': instance.studentImage,
      'id': instance.id,
      'rating': instance.rating,
      'reviewContent': instance.reviewContent,
      'createdAt': instance.createdAt,
      'count': instance.count,
    };
