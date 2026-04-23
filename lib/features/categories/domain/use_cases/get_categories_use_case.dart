import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/categories/domain/repos/category_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case_interface.dart';
import '../entities/category_entity.dart';

class GetCategoriesUseCase implements UseCase<List<CategoryEntity>, NoParams> {
  final CategoryRepo repository;

  GetCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    final result = await repository.getCategories();

    return result.fold((failure) => Left(failure), (categories) {
      final validCategories = categories.take(5).toList();
      return Right(validCategories);
    });
  }
}
