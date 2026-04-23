import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SearchAndFilterSection extends StatelessWidget {
  const SearchAndFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search any Product',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                fillColor: AppColors.white,
                hintStyle: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: AppColors.darkGrey),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.darkGrey,
                  size: 26,
                ),
                contentPadding: EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none, // ده اللي هيخفي الخط الرمادي
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          SizedBox(width: 12),

          // زرار الفلتر بلون الـ Primary بتاعك
          GestureDetector(
            onTap: () {
              // Logic الفلترة بالـ Price
            },
            child: Container(
              height: 50, // متناسق مع ارتفاع الـ TextField
              width: 50,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(
                  10,
                ), // نفس الـ radius اللي في الثيم
              ),
              child: const Icon(Icons.tune, color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
