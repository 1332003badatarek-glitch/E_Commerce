import 'package:e_commerce/features/products/presentation/widgets/product_ishimmer_loading.dart';
import 'package:flutter/widgets.dart';

class ProductsLoadingList extends StatelessWidget {
  const ProductsLoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.60,
      ),
      itemBuilder: (context, index) => const ProductShimmerLoading(),
    );
  }
}
