import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/use_cases/use_case_interface.dart';
import 'package:e_commerce/features/user/domain/entities/user_entity.dart';
import 'package:e_commerce/features/user/domain/repos/user_repo.dart';

class GetProfileUseCase extends UseCase<UserEntity, NoParams> {
  final UserRepo repository;

  GetProfileUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await repository.getProfile();
  }
}
