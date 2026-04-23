import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/use_cases/use_case_interface.dart';
import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce/features/products/domain/repos/products_repo.dart';

class FilterProductsUseCase
    implements UseCase<List<ProductEntity>, FilterProductsParams> {
  final ProductsRepo _productsRepo;

  FilterProductsUseCase(this._productsRepo);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(
    FilterProductsParams params,
  ) async {
    return await _productsRepo.filterProductsByPrice(
      price: params.price,
      minPrice: params.minPrice,
      maxPrice: params.maxPrice,
    );
  }
}

class FilterProductsParams {
  final int? price;
  final int? minPrice;
  final int? maxPrice;

  FilterProductsParams({this.price, this.minPrice, this.maxPrice});
}
