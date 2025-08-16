import 'package:json_annotation/json_annotation.dart';

part 'course_info_model.g.dart';

@JsonSerializable()
class CourseInfoModel {
  final int id;
  final String? title;
  final String? description;
  final String? requirements;
  final double? price;
  final String? thumbnail;
  final DateTime? createdAt;
  final bool? isActive;
  final int? durationInHours;
  final double? rating;
  final String? instructorId;
  final String? instructorName;
  final int? categoryId;
  final String? categoryName;
  final String? courseStatus;
  final String? instructorImage;
  final bool? isDeleted;
  final bool? useAIAssistant;
  final String? courseLanguage;

  CourseInfoModel({
    required this.id, 
    this.title,
    this.description,
    this.requirements,
    this.price,
    this.thumbnail,
    this.createdAt,
    this.isActive,
    this.durationInHours,
    this.rating,
    this.instructorId,
    this.instructorName,
    this.categoryId,
    this.categoryName,
    this.courseStatus,
    this.instructorImage,
    this.isDeleted,
    this.useAIAssistant,
    this.courseLanguage
  });

  factory CourseInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CourseInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseInfoModelToJson(this);
}
