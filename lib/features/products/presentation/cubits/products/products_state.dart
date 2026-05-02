import 'package:e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductEntity> products;
  const ProductsSuccess(this.products);

  @override
  List<Object?> get props => [products];
}

final class ProductsFailure extends ProductsState {
  final String errorMessage;
  const ProductsFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
