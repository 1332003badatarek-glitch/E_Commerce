import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/cache/secure_storage_interface.dart';
import 'package:e_commerce/core/errors/error_handler.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/network/api_constants.dart';
import 'package:e_commerce/features/auth/data/data_sources/remote/auth_api_service.dart';
import 'package:e_commerce/features/auth/data/mappers/auth_mapper.dart';
import 'package:e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';

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
  Future<Either<Failure, UserEntity>> getProfile() async {
    try {
      final userModel = await _apiService.getProfile();
      return Right(AuthMapper.mapUserModelToEntity(userModel));
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
    required String avatar,
  }) async {
    try {
      final userModel = await _apiService.signUp({
        'name': name,
        'email': email,
        'password': password,
        'avatar': avatar,
      });
      return Right(AuthMapper.mapUserModelToEntity(userModel));
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
