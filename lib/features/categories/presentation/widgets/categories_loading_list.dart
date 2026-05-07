
import 'package:e_commerce/features/categories/presentation/widgets/category_shimmer_loading.dart';
import 'package:flutter/widgets.dart';

class CategoriesLoadingList extends StatelessWidget {
  const CategoriesLoadingList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, 
      scrollDirection: Axis.horizontal,
      physics:
          NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: CategoryShimmerLoading(),
        );
      },
    );
  }
}
