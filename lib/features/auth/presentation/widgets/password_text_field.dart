import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String hintText;
  const PasswordTextField({
    super.key,
    this.validator,
    this.controller,
    this.hintText = 'Password',
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: isObscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Icon(Icons.lock, size: 26),

        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isObscureText = !isObscureText;
            });
          },
          icon: Icon(
            isObscureText
                ? Icons.visibility_off_outlined
                : Icons.remove_red_eye_outlined,
            size: 24,
            color: const Color(0xFF626262),
          ),
        ),
      ),
    );
  }
}
