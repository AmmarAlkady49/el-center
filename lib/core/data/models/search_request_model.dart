import 'package:json_annotation/json_annotation.dart';

part 'search_request_model.g.dart';

@JsonSerializable()
class SearchRequestModel {
  final int? pagenum;
  @JsonKey(name: 'Maxpagesize')
  final int? maxpagesize;
  final int? pagesize;
  final String? sort;
  final int? categoryId;
  final String? language;
  final String? search;
  final double? minPrice;
  final double? maxPrice;

  SearchRequestModel(
      {this.pagenum,
      this.maxpagesize,
      this.pagesize,
      this.sort,
      this.categoryId,
      this.language,
      this.search,
      this.minPrice,
      this.maxPrice});

  factory SearchRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchRequestModelToJson(this);
}
