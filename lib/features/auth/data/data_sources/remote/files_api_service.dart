import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/image_upload_response.dart';
import '../../../../../core/network/api_constants.dart';

part 'files_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class FilesApiService {
  factory FilesApiService(Dio dio, {String baseUrl}) = _FilesApiService;

  @POST(ApiConstants.fileUploadEndpoint)
  @MultiPart()
  Future<ImageUploadResponse> uploadFile(@Part() File file);
}
