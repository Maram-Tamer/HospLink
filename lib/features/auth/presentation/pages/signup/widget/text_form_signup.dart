import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';

class TextFormSignup extends StatelessWidget {
  const TextFormSignup({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
  }) : _emailController = emailController, _passwordController = passwordController, _confirmPasswordController = confirmPasswordController;

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: MainTextFormField(
            label: 'Email',
            ispassword: false,
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              final emailRegex =
                  RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
              if (!emailRegex.hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
        ),
        const Gap(20),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: MainTextFormField(
            label: 'Password',
            ispassword: true,
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
        ),
        const Gap(20),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: MainTextFormField(
            label: 'Confirm Password',
            ispassword: true,
            controller: _confirmPasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
