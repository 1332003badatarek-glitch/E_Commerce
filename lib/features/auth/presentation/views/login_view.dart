import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/login_form.dart';
import 'package:e_commerce/features/auth/presentation/widgets/sign_up_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginFailure,
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else if (state is LoginSuccess) {
          Navigator.pop(context);
          Navigator.pushNamed(context, Routes.homeView);
        } else if (state is LoginFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.erorrMessage,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              backgroundColor: AppColors.primary,
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome\nBack!',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(height: 30),
                  const LoginForm(),
                  SizedBox(height: 20),
                  const SignUpNavigationWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
