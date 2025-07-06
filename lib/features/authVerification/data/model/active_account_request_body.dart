import 'package:json_annotation/json_annotation.dart';

part 'active_account_request_body.g.dart';

@JsonSerializable()
class ActiveAccountRequestBody {
  final String email;
  final String code;

  ActiveAccountRequestBody({required this.email, required this.code});

  factory ActiveAccountRequestBody.fromJson(Map<String, dynamic> json) =>
      _$ActiveAccountRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveAccountRequestBodyToJson(this);
}
