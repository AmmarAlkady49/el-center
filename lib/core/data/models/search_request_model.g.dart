// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRequestModel _$SearchRequestModelFromJson(Map<String, dynamic> json) =>
    SearchRequestModel(
      pagenum: (json['pagenum'] as num?)?.toInt(),
      maxpagesize: (json['Maxpagesize'] as num?)?.toInt(),
      pagesize: (json['pagesize'] as num?)?.toInt(),
      sort: json['sort'] as String?,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      language: json['language'] as String?,
      search: json['search'] as String?,
      minPrice: (json['minPrice'] as num?)?.toDouble(),
      maxPrice: (json['maxPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SearchRequestModelToJson(SearchRequestModel instance) =>
    <String, dynamic>{
      'pagenum': instance.pagenum,
      'Maxpagesize': instance.maxpagesize,
      'pagesize': instance.pagesize,
      'sort': instance.sort,
      'categoryId': instance.categoryId,
      'language': instance.language,
      'search': instance.search,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
    };
