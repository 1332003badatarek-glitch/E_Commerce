// features/auth/data/models/sign_up_request_body.dart
import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  final String name;
  final String email;
  final String password;
  final String avatar;

  SignUpRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
  });

  factory SignUpRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
