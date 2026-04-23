import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import '../entities/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> fetchProducts();

  Future<Either<Failure, List<ProductEntity>>> filterProductsByPrice({
    int? price,
    int? minPrice,
    int? maxPrice,
  });
}
