import 'package:json_annotation/json_annotation.dart';

part 'active_account_response_body.g.dart';

@JsonSerializable()
class ActiveAccountResponseBody {
  final int statusCode;
  final String message;

  ActiveAccountResponseBody({required this.statusCode, required this.message});

  factory ActiveAccountResponseBody.fromJson(Map<String, dynamic> json) => _$ActiveAccountResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveAccountResponseBodyToJson(this);

  
}