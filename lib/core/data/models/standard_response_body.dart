import 'package:json_annotation/json_annotation.dart';

part 'standard_response_body.g.dart';

@JsonSerializable()
class StandardResponseBody {
  final int statusCode;
  final String message;

  StandardResponseBody({required this.statusCode, required this.message});

  factory StandardResponseBody.fromJson(Map<String, dynamic> json) =>
      _$StandardResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$StandardResponseBodyToJson(this);
}
