import 'package:dio/dio.dart';
import 'package:e_commerce/core/network/api_constants.dart';
import 'package:e_commerce/features/auth/data/models/login_response_model.dart';
import 'package:e_commerce/features/auth/data/models/sign_up_request_body.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponseModel> login(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.signUpEndpoint)
Future<UserModel> signUp(@Body() SignUpRequestBody signUpRequestBody);

  @GET(ApiConstants.profileEndpoint)
  Future<UserModel> getProfile();
}
