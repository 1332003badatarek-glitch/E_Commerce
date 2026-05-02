import 'package:e_commerce/core/use_cases/use_case_interface.dart';
import 'package:e_commerce/features/products/domain/use_cases/filter_products_by_price_use_case.dart';
import 'package:e_commerce/features/products/domain/use_cases/get_products_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final GetProductsUseCase _getProductsUseCase;
  final FilterProductsUseCase _filterProductsUseCase;

  ProductsCubit(this._getProductsUseCase, this._filterProductsUseCase)
    : super(ProductsInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await _getProductsUseCase(NoParams());

    result.fold(
      (failure) => emit(ProductsFailure(failure.message)),
      (products) => emit(ProductsSuccess(products)),
    );
  }

  Future<void> filterProductsByPrice({
    int? price,
    int? minPrice,
    int? maxPrice,
  }) async {
    emit(ProductsLoading());

    final result = await _filterProductsUseCase(
      FilterProductsParams(
        price: price,
        minPrice: minPrice,
        maxPrice: maxPrice,
      ),
    );

    result.fold(
      (failure) => emit(ProductsFailure(failure.message)),
      (products) => emit(ProductsSuccess(products)),
    );
  }
}
