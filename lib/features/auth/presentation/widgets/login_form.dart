import 'package:e_commerce/core/helpers/app_validators.dart';
import 'package:e_commerce/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/auth_button.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_tex_form_field.dart';
import 'package:e_commerce/features/auth/presentation/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _emailController,
            hintText: 'Username or Email',
            prefixIcon: Icons.person,
            validator: (value) => AppValidators.validateEmail(value),
          ),
          SizedBox(height: 20),
          PasswordTextField(
            controller: _passwordController,
            validator: (value) => AppValidators.validatePassword(value),
          ),
          SizedBox(height: 40),
          AuthButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<LoginCubit>().login(
                  email: _emailController.text.trim(),
                  password: _passwordController.text,
                );
              }
            },
            title: 'Login',
          ),
        ],
      ),
    );
  }
}
