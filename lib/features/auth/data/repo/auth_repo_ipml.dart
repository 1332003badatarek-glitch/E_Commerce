import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/cache/secure_storage_interface.dart';
import 'package:e_commerce/core/errors/error_handler.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/network/api_constants.dart';
import 'package:e_commerce/features/auth/data/data_sources/remote/auth_api_service.dart';
import 'package:e_commerce/features/user/data/mappers/user_mapper.dart';
import 'package:e_commerce/features/auth/data/models/sign_up_request_body.dart';
import 'package:e_commerce/features/user/domain/entities/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:e_commerce/features/auth/domain/use_cases/sign_up_use_case.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthApiService _apiService;
  final SecureStorage _secureStorage;

  AuthRepoImpl(this._apiService, this._secureStorage);
  @override
  Future<Either<Failure, Unit>> login({
    required String email,
    required String password,
  }) async {
    try {
      final loginModel = await _apiService.login({
        'email': email,
        'password': password,
      });

      await _secureStorage.saveSecureData(
        key: ApiConstants.accessToken,
        value: loginModel.accessToken,
      );
      await _secureStorage.saveSecureData(
        key: ApiConstants.refreshToken,
        value: loginModel.refreshToken,
      );

      return const Right(unit);
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }

  

  @override
  Future<Either<Failure, UserEntity>> signUp(SignUpParams signUpParams) async {
    try {
      final userModel = await _apiService.signUp(
        SignUpRequestBody(
          name: signUpParams.name,
          email: signUpParams.email,
          password: signUpParams.password,
          avatar:
              signUpParams.avatarUrl ??
              "https://api.escuelajs.co/static/default-avatar.png",
        ),
      );
      return Right(UserMapper.userModelToEntityMap(userModel));
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> logOut() {
    //  todo logout implementation
    throw UnimplementedError();
  }
}
