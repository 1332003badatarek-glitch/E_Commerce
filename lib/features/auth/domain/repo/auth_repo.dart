import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/auth/domain/use_cases/sign_up_use_case.dart';
import '../../../../core/errors/failure.dart';
import '../../../user/domain/entities/user_entity.dart';

abstract class AuthRepo {

  Future<Either<Failure, Unit>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> getProfile();

  Future<Either<Failure, UserEntity>> signUp(SignUpParams signUpParams);

  Future<Either<Failure, UserEntity>> logOut();
}
