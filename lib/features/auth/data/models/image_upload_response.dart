import 'package:json_annotation/json_annotation.dart';

part 'image_upload_response.g.dart';
@JsonSerializable(createToJson: false)
class ImageUploadResponse {
  final String location;

  ImageUploadResponse({required this.location});

  factory ImageUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageUploadResponseFromJson(json);
}