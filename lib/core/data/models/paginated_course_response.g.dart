// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedCourseResponse _$PaginatedCourseResponseFromJson(
        Map<String, dynamic> json) =>
    PaginatedCourseResponse(
      pageNumber: (json['pageNumber'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      totalCount: (json['totalCount'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => CourseInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedCourseResponseToJson(
        PaginatedCourseResponse instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'totalCount': instance.totalCount,
      'data': instance.data,
    };
