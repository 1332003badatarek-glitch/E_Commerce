
import 'package:flutter/material.dart';

class SignUpNavigationWidget extends StatelessWidget {
  const SignUpNavigationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        TextButton(
          onPressed: () {
            // Nav to Sign Up
          }, 
          child: const Text('Sign Up')
        ),
      ],
    );
  }
}


