import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';


@JsonSerializable(createToJson: false)
class LoginResponseModel {
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  LoginResponseModel({required this.accessToken, required this.refreshToken});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
}