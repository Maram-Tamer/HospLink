import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/features/auth/presentation/pages/Login/page/login_screen.dart';

class CardLogin extends StatelessWidget {
  CardLogin({
    super.key,
    required this.routeForgetPassword,
    required this.widget,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.onPressed, required Color titleColor, required Color subTitleColor,
  })  : _emailController = emailController,
        _passwordController = passwordController;

  final String routeForgetPassword;
  final LoginScreen widget;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodySmall?.color ?? Colors.black87;

    // Responsive scale based on width
    final width = MediaQuery.of(context).size.width;
    double scale = (width / 430).clamp(0.85, 1.2);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(widget.icon, width: 60 * scale, height: 60 * scale),
        Gap(20 * scale),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15 * scale),
          child: MainTextFormField(
            label: 'Email',
            ispassword: false,
            controller: _emailController,
            textColor: textColor,
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
        Gap(20 * scale),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15 * scale),
          child: MainTextFormField(
            label: 'Password',
            ispassword: true,
            controller: _passwordController,
            textColor: textColor,
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
        Gap(10 * scale),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 20 * scale),
            child: GestureDetector(
              onTap: () {
                pushTo(
                  context: context,
                  route: Routes.forgetPassword,
                  extra: routeForgetPassword,
                );
              },
              child: Text(
                'Forget Password ?',
                style: TextStyle(
                  fontSize: 14 * scale,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ),
        ),
        Gap(20 * scale),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15 * scale),
          child: MainButton(
            buttonText: 'Login',
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
