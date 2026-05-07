import 'package:e_commerce/features/products/presentation/cubits/products/products_cubit.dart';
import 'package:e_commerce/features/products/presentation/cubits/products/products_state.dart';
import 'package:e_commerce/features/products/presentation/widgets/products_grid_view.dart';
import 'package:e_commerce/features/products/presentation/widgets/products_loading_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsBuilder extends StatelessWidget {
  const ProductsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsGridView(products: state.products);
        } else if (state is ProductsFailure) {
          return Center(
            child: Column(
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 40),
                Text(state.errorMessage),
                TextButton(
                  onPressed: () => context.read<ProductsCubit>().getProducts(),
                  child: const Text("Try Again"),
                ),
              ],
            ),
          );
        } else {
          return const ProductsLoadingList();
        }
      },
    );
  }
}
