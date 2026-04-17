import 'package:dio/dio.dart';
import 'package:e_commerce/core/network/api_constants.dart';
import 'package:e_commerce/features/categories/data/models/category_model.dart';
import 'package:retrofit/retrofit.dart';

part 'category_api_service.g.dart';

@RestApi()
abstract class CategoryApiService {
  factory CategoryApiService(Dio dio, {String baseUrl}) = _CategoryApiService;

  @GET(ApiConstants.categoriesEndpoint)
  Future<List<CategoryModel>> getCategories();
}
