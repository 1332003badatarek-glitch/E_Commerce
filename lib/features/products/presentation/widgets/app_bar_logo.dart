import 'package:e_commerce/core/helpers/app_constants.dart';
import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
    );
  }
}
