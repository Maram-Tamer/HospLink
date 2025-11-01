import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/auth/presentation/pages/Login/page/login_screen.dart';

class CardLogin extends StatelessWidget {
  CardLogin({
    super.key,
    required this.routeForgetPassword,
    required this.widget,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.onPressed,
  })  : _emailController = emailController,
        _passwordController = passwordController;
  String routeForgetPassword;
  final LoginScreen widget;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(widget.icon, width: 60, height: 60),
        Gap(20),
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
              final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
              if (!emailRegex.hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
        ),
        Gap(20),
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
        Gap(10),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                pushTo(
                    context: context,
                    route: Routes.forgetPassword,
                    extra: routeForgetPassword);
              },
              child: Text(
                'Forget Password ?',
                style: AppFontStyles.getSize14(
                  fontWeight: FontWeight.w500,
                  fontColor: AppColors.primaryGreenColor,
                ),
              ),
            ),
          ),
        ),
        Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: MainButton(
            buttonText: 'Login',
            onPressed: onPressed
          ),
        ),
      ],
    );
  }
}
