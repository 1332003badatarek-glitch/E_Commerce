import 'package:flutter/material.dart';
import 'product_item.dart'; // تأكد من مسار الـ widget اللي عملناها

class ProductsGridView extends StatelessWidget {
  // final List<ProductEntity> products;

  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // جعل الـ Grid تأخذ مساحة المحتوى فقط ولا تملأ الشاشة لو كانت داخل ScrollView
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      // itemCount: products.length,
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عدد الأعمدة
        crossAxisSpacing: 16, // المسافة الأفقية بين الأيتمز
        mainAxisSpacing: 16, // المسافة الرأسية بين الأيتمز
        childAspectRatio:
            0.60, // معامل التناسب (طول الأيتم بالنسبة لعرضها) عشان ميبقاش فيه Overflow
      ),
      itemBuilder: (context, index) {
        return ProductItem();
      },
    );
  }
}
