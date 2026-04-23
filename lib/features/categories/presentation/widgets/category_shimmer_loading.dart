import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmerLoading extends StatelessWidget {
  const CategoryShimmerLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 50,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
