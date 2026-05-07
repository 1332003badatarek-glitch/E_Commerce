import 'package:e_commerce/features/categories/presentation/widgets/categories_list_view.dart';
import 'package:e_commerce/features/products/presentation/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/products/presentation/widgets/Search_and_filter_section.dart';
import 'package:e_commerce/features/products/presentation/widgets/products_bloc_slector.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 8, left: 14, right: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                SearchAndFilterSection(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 6),
                  child: Text(
                    'All Featured',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                CategoriesListView(),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ProductsBlocSlector(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
