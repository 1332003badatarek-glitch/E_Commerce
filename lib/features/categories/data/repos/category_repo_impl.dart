import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/error_handler.dart';
import 'package:e_commerce/features/categories/data/data_source/remote/category_api_service.dart';
import 'package:e_commerce/features/categories/domain/repos/category_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/category_entity.dart';

class CategoryRepoImpl implements CategoryRepo {
  final CategoryApiService apiService;

  CategoryRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final categoryModels = await apiService.getCategories();

      final categoryEntities = categoryModels
          .map((model) => model.toEntity())
          .toList();

      return Right(categoryEntities);
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }
}
