import 'package:e_commerce/core/helpers/app_constants.dart';
import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 1. مساحة فارغة مكان المنيو (عشان يفضل اللوجو في النص بالظبط)
        const SizedBox(width: 40),

        // 2. اللوجو والاسم في المنتصف
        Row(
          children: [
            // اللوجو (استخدم السورس اللي عندك سواء Image.asset أو Svg)
            Image.asset(AppConstants.appLogo, height: 30),
            const SizedBox(width: 8),
            Text(
              'Eshop',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.blueColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        // 3. صورة البروفايل على اليمين
        const CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.lightGrey,
          backgroundImage: AssetImage(AppConstants.userAvatar),
        ),
      ],
    );
  }
}
