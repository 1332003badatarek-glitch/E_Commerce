import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce/core/theme/app_colors.dart';

class AppTextStyles {
  static const String _fontFamily = 'Montserrat';

  static TextStyle font24BoldBlack = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    fontFamily: _fontFamily,
  );

  static TextStyle font18SemiBoldBlack = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontFamily: _fontFamily,
  );

  static TextStyle font12MediumBlack = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontFamily: _fontFamily,
  );

  static TextStyle font12RegularGrey = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGrey,
    fontFamily: _fontFamily,
  );

  static TextStyle font16SemiBoldWhite = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    fontFamily: _fontFamily,
  );

  static TextStyle font12SemiBoldPrimary = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    fontFamily: _fontFamily,
  );

  static TextStyle font12RegularHintGrey = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGrey,
    fontFamily: _fontFamily,
  );

  static TextStyle font14SemiBoldBlack = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontFamily: _fontFamily,
  );

  static TextStyle font12RegularOldPriceGrey = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.discountPrice,
    decoration: TextDecoration.lineThrough,
    fontFamily: _fontFamily,
  );

  static TextStyle font10RegularDiscountOrange = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.discountPercent,
    fontFamily: _fontFamily,
  );
}
