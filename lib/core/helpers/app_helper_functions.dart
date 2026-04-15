import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppHelperFunctions {

    static Future<dynamic> loadingDialog(BuildContext context) {
    return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
  }


  static void showFailure(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}