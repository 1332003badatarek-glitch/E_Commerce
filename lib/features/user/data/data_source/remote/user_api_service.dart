import 'package:dio/dio.dart';
import 'package:e_commerce/core/network/api_constants.dart';
import 'package:e_commerce/features/user/data/models/user_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'user_api_service.g.dart';

@RestApi()
abstract class UserApiService {
  factory UserApiService(Dio dio, {String baseUrl}) = _UserApiService;

  @GET(ApiConstants.profileEndpoint)
  Future<UserModel> getProfile();
}
