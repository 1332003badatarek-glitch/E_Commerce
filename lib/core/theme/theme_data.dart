import 'package:e_commerce/core/theme/app_text_syles.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.white,
      brightness: Brightness.light,
      fontFamily: 'Montserrat',

      textTheme: TextTheme(
        displayLarge: AppTextStyles.font24BoldBlack,
        headlineLarge: AppTextStyles.font24BoldBlack,

        headlineMedium: AppTextStyles.font18SemiBoldBlack,

        titleMedium: AppTextStyles.font14SemiBoldBlack,

        bodyLarge: AppTextStyles.font12MediumBlack,

        bodyMedium: AppTextStyles.font12RegularGrey,

        labelSmall: AppTextStyles.font10RegularDiscountOrange,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.font18SemiBoldBlack,
        iconTheme: const IconThemeData(color: AppColors.black),
      ),

      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        onPrimary: AppColors.white,
        surface: AppColors.white,
        error: AppColors.primary,
      ),
    );
  }
}
