import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/errors/error_handler.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/user/data/data_source/remote/user_api_service.dart';
import 'package:e_commerce/features/user/data/mappers/user_mapper.dart';
import 'package:e_commerce/features/user/domain/entities/user_entity.dart';
import 'package:e_commerce/features/user/domain/repos/user_repo.dart';

class UserRepoImpl implements UserRepo {
  final UserApiService _apiService;
  final CacheHelper _cacheHelper;

  UserRepoImpl(this._apiService, this._cacheHelper);
  @override
  Future<Either<Failure, UserEntity>> getProfile() async {
    try {
      final userModel = await _apiService.getProfile();

      await _cacheHelper.saveData(key: 'user_name', value: userModel.name);
      await _cacheHelper.saveData(key: 'user_image', value: userModel.avatar);
      await _cacheHelper.saveData(key: 'email', value: userModel.email);
      await _cacheHelper.saveData(key: 'id', value: userModel.id);

      return Right(UserMapper.userModelToEntityMap(userModel));
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }
}
