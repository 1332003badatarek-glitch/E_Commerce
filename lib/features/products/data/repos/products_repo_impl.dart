import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/error_handler.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/products/data/data_source/remote/products_api_service.dart';
import 'package:e_commerce/features/products/domain/repos/products_repo.dart';
import '../../domain/entities/product_entity.dart';
import '../mappers/product_mapper.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ProductsApiService _productsApiService;

  ProductsRepoImpl(this._productsApiService);

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchProducts() async {
    try {
      final productModels = await _productsApiService.getProducts();

      final productEntities = productModels
          .map((model) => ProductMapper.toEntity(model))
          .toList();

      return Right(productEntities);
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> filterProductsByPrice({
    int? price,
    int? minPrice,
    int? maxPrice,
  }) async {
    try {
      final productModels = await _productsApiService.filterProductsByPrice(
        price: price,
        minPrice: minPrice,
        maxPrice: maxPrice,
      );

      final productEntities = productModels
          .map((model) => ProductMapper.toEntity(model))
          .toList();

      return Right(productEntities);
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }
}
