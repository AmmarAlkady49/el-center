import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_courses_api_request_model.g.dart';

@JsonSerializable()
class GetAllCoursesApiRequestModel {
  final int? pagenum;
  @JsonKey(name: 'Maxpagesize')
  final int? maxpagesize;
  final int? pagesize;
  final String? sort;
  final int? categoryId;
  final String? search;
  final double? minPrice;
  final double? maxPrice;

  GetAllCoursesApiRequestModel(
      {required this.pagenum,
      required this.maxpagesize,
      required this.pagesize,
      required this.sort,
      required this.categoryId,
      required this.search,
      required this.minPrice,
      required this.maxPrice});

  factory GetAllCoursesApiRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllCoursesApiRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCoursesApiRequestModelToJson(this);
}
