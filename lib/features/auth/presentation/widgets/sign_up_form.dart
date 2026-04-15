import 'dart:io';

import 'package:e_commerce/core/helpers/app_validators.dart';
import 'package:e_commerce/features/auth/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/auth_button.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_tex_form_field.dart';
import 'package:e_commerce/features/auth/presentation/widgets/image_picker_widget.dart';
import 'package:e_commerce/features/auth/presentation/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  File? _selectedImage;

  @override
  void dispose() {
    _nameController.dispose();
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
          ImagePickerWidget(
            onImagePicked: (image) {
              _selectedImage = image;
            },
          ),
          SizedBox(height: 20),

          CustomTextFormField(
            controller: _nameController,
            hintText: 'Name',
            prefixIcon: Icons.person,
            validator: (value) => AppValidators.validateRequired(value, 'Name'),
          ),
          SizedBox(height: 20),

          CustomTextFormField(
            controller: _emailController,
            hintText: 'Username or Email',
            prefixIcon: Icons.email,
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
                context.read<SignUpCubit>().signUp(
                  name: _nameController.text.trim(),
                  email: _emailController.text.trim(),
                  password: _passwordController.text,
                  imageFile: _selectedImage, // تم الاستخدام بنجاح!
                );
              }
            },
            title: 'SignUp',
          ),
        ],
      ),
    );
  }
}
