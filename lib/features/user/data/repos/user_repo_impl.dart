import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/error_handler.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/user/data/data_source/remote/user_api_service.dart';
import 'package:e_commerce/features/user/data/mappers/user_mapper.dart';
import 'package:e_commerce/features/user/domain/entities/user_entity.dart';
import 'package:e_commerce/features/user/domain/repos/user_repo.dart';

class UserRepoImpl implements UserRepo {
  final UserApiService _apiService;
  UserRepoImpl(this._apiService);
  @override
  Future<Either<Failure, UserEntity>> getProfile() async {
    try {
      final userModel = await _apiService.getProfile();
      return Right(UserMapper.userModelToEntityMap(userModel));
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }
}
