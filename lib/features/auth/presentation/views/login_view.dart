import 'package:e_commerce/core/helpers/app_helper_functions.dart';
import 'package:e_commerce/core/routing/routes.dart';
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
      listenWhen: (previous, current) => current is! LoginInitial,
      listener: (context, state) {
        if (state is LoginLoading) {
          AppHelperFunctions.loadingDialog(context);
        } else if (state is LoginSuccess) {
          Navigator.pop(context);
          AppHelperFunctions.showSuccess(
            context,
            'Welcome back, ${state.userEntity.name}',
          );
          Navigator.pushNamed(context, Routes.homeView);
        } else if (state is LoginFailure) {
          Navigator.pop(context);
          AppHelperFunctions.showFailure(context, state.errorMessage);
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
