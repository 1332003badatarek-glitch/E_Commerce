import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/features/user/presentation/cubits/user_cubit/user_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_avatar.dart';

class UserAvatarBlocSelector extends StatelessWidget {
  const UserAvatarBlocSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      buildWhen: (previous, current) =>
          current is UserSuccess ||
          current is UserFailure ||
          current is UserLoading,
      builder: (context, state) {
        if (state is UserSuccess) {
          return UserAvatar(imageUrl: state.user.avatar);
        }
        return const CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.lightGrey,
          child: Icon(Icons.person, color: Colors.white),
        );
      },
    );
  }
}
