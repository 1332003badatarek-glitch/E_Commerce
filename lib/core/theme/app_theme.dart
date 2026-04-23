import 'package:e_commerce/core/theme/app_text_syles.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.customWhite,
      brightness: Brightness.light,
      fontFamily: 'Montserrat',

      textTheme: TextTheme(
        displayLarge: AppTextStyles.font36BoldBlack,
        headlineLarge: AppTextStyles.font36BoldBlack,

        headlineMedium: AppTextStyles.font18SemiBoldBlack,

        titleMedium: AppTextStyles.font14SemiBoldBlack,

        bodyLarge: AppTextStyles.font12MediumBlack,
        bodySmall: AppTextStyles.font12SemiBoldPrimary,

        bodyMedium: AppTextStyles.font12RegularGrey,

        labelSmall: AppTextStyles.font10RegularDiscountBlack,
        titleSmall: AppTextStyles.font14SimiBoldWhite,
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

      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        filled: true,
        fillColor: AppColors.customWhite,

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkGrey, width: 1.3),
          borderRadius: BorderRadius.circular(10),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary, width: 1.3),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.red, width: 1.3),

          borderRadius: BorderRadius.circular(10),
        ),
        errorStyle: AppTextStyles.font12SemiBoldPrimary.copyWith(
          color: AppColors.red,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.red, width: 1.3),

          borderRadius: BorderRadius.circular(10),
        ),
        hintStyle: AppTextStyles.font14SemiBoldGrey,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,

          minimumSize: Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: AppTextStyles.font20SimiBoldWhite,
          elevation: 0,
        ),
      ),
    );
  }
}
