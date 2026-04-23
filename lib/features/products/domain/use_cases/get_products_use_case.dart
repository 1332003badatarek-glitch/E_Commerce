import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/use_cases/use_case_interface.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/domain/repos/products_repo.dart';
import '../../../../../core/errors/failure.dart';


class GetProductsUseCase implements UseCase<List<ProductEntity>, NoParams> {
  final ProductsRepo _productsRepo;

  GetProductsUseCase(this._productsRepo);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return await _productsRepo.fetchProducts();
  }
}