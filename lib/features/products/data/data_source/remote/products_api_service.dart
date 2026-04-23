import 'package:dio/dio.dart';
import 'package:e_commerce/core/network/api_constants.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:retrofit/retrofit.dart';

part 'products_api_service.g.dart';

@RestApi()
abstract class ProductsApiService {
  factory ProductsApiService(Dio dio, {String baseUrl}) = _ProductsApiService;

  @GET(ApiConstants.productsEndpoint)
  Future<List<ProductModel>> getProducts();

  @GET(ApiConstants.productsEndpoint)
  Future<List<ProductModel>> filterProductsByPrice({
    @Query(ApiConstants.price) int? price,
    @Query(ApiConstants.minPrice) int? minPrice,
    @Query(ApiConstants.maxPrice) int? maxPrice,
  });
}
