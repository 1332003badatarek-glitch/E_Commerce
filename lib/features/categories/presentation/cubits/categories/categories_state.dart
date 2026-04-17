part of 'categories_cubit.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final List<CategoryEntity> categories;
  @override
  List<Object> get props => [categories];
  const CategoriesSuccess(this.categories);
}

class CategoriesFailure extends CategoriesState {
  final String errorMessage;

  const CategoriesFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
