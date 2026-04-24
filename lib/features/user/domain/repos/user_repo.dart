import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/user/domain/entities/user_entity.dart';

abstract class UserRepo {
  Future<Either<Failure, UserEntity>> getProfile();
}
