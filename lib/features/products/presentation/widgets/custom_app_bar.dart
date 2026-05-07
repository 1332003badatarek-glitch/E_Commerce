import 'package:flutter/material.dart';
import 'app_bar_logo.dart';
import 'user_avatar_bloc_selector.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [SizedBox(width: 40), AppBarLogo(), UserAvatarBlocSelector()],
    );
  }
}
