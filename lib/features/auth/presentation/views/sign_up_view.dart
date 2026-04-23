import 'package:e_commerce/core/helpers/app_helper_functions.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/features/auth/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) => current is! SignUpInitial,

      listener: (context, state) {
        if (state is SignUpLoading) {
          AppHelperFunctions.loadingDialog(context);
        } else if (state is SignUpSuccess) {
          Navigator.pop(context);
          AppHelperFunctions.showSuccess(
            context,
            'Account created successfully',
          );
          Navigator.pushNamed(context, Routes.loginView);
        } else if (state is SignUpFailure) {
          Navigator.pop(context);
          AppHelperFunctions.showFailure(context, state.erorrMessage);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create an\nAccount',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 30),
                  SignUpForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
