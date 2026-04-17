import 'package:e_commerce/core/use_cases/use_case_interface.dart';
import 'package:e_commerce/features/categories/domain/entities/category_entity.dart';
import 'package:e_commerce/features/categories/domain/use_cases/get_categories_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  CategoriesCubit(this.getCategoriesUseCase) : super(CategoriesInitial());

  Future<void> fetchCategories() async {
    emit(CategoriesLoading());

    final result = await getCategoriesUseCase(NoParams());

    result.fold(
      (failure) => emit(CategoriesFailure(errorMessage: failure.message)),
      (categories) => emit(CategoriesSuccess(categories)),
    );
  }
}
