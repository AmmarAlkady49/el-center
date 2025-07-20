// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_courses_api_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCoursesApiRequestModel _$GetAllCoursesApiRequestModelFromJson(
        Map<String, dynamic> json) =>
    GetAllCoursesApiRequestModel(
      pagenum: (json['pagenum'] as num?)?.toInt(),
      maxpagesize: (json['Maxpagesize'] as num?)?.toInt(),
      pagesize: (json['pagesize'] as num?)?.toInt(),
      sort: json['sort'] as String?,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      search: json['search'] as String?,
      minPrice: (json['minPrice'] as num?)?.toDouble(),
      maxPrice: (json['maxPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GetAllCoursesApiRequestModelToJson(
        GetAllCoursesApiRequestModel instance) =>
    <String, dynamic>{
      'pagenum': instance.pagenum,
      'Maxpagesize': instance.maxpagesize,
      'pagesize': instance.pagesize,
      'sort': instance.sort,
      'categoryId': instance.categoryId,
      'search': instance.search,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
    };
