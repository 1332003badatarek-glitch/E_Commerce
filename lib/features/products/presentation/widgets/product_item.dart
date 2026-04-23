import 'package:e_commerce/core/helpers/app_constants.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ProductItem extends StatelessWidget {
  // final ProductEntity product;

  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. صورة المنتج
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              AppConstants.userAvatar, // الـ Entity بتاعنا فيه الصورة جاهزة
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 2. اسم المنتج
                Text(
                  'Mens Starry',
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                // 3. الوصف
                Text(
                  'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
                  style: Theme.of(context).textTheme.labelSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                // 4. السعر (باللون البرايمري بتاعك)
                Text(
                  // '\$${product.price}',
                  '\$${3400}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
