import 'package:e_commerce/features/categories/presentation/cubits/categories/categories_cubit.dart';
import 'package:e_commerce/features/categories/presentation/widgets/category_item.dart';
import 'package:e_commerce/features/categories/presentation/widgets/category_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          return SizedBox(
            height: 110,
            child: ListView.builder(
              itemCount: state.categories.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CategoryItem(category: state.categories[index]),
                );
              },
            ),
          );
        } else if (state is CategoriesFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          // حالة الـ Loading
          return SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: 5, // بنعرض 5 عناصر وهمية لحد ما الداتا تيجي
              scrollDirection: Axis.horizontal,
              physics:
                  NeverScrollableScrollPhysics(), // بنوقف السكرول أثناء اللودينج
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: CategoryShimmerLoading(),
                );
              },
            ),
          );
        }
      },
    );
  }
}
