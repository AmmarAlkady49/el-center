import 'package:json_annotation/json_annotation.dart';
import 'course_info_model.dart';

part 'paginated_course_response.g.dart';

@JsonSerializable()
class PaginatedCourseResponse {
  final int pageNumber;
  final int pageSize;
  final int totalCount;
  final List<CourseInfoModel> data;

  PaginatedCourseResponse({
    required this.pageNumber,
    required this.pageSize,
    required this.totalCount,
    required this.data,
  });

  factory PaginatedCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedCourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedCourseResponseToJson(this);
}
