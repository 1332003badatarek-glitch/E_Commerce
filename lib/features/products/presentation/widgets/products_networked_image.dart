
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProductsNetworkedImage extends StatelessWidget {
  const ProductsNetworkedImage({super.key, required this.productImage});

  final String productImage;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: (productImage.isNotEmpty) ? productImage : "",
      height: 140,
      width: double.infinity,
      fit: BoxFit.cover,

      placeholder: (context, url) => Container(
        color: AppColors.darkGrey,
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.primary,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image_not_supported_outlined, color: Colors.grey[500]),
            const SizedBox(height: 4),
            Text(
              "Product has no image yet",
              style: TextStyle(color: Colors.grey[500], fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
