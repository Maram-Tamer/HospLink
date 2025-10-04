import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medigo/components/ScrrenBackgroung/background.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/auth/presentation/widget/card_login_with.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    super.key,
    required this.icon,
    required this.subTitle,
    required this.title,
    required this.route,
    required this.routeAfterLogin,
  });
  String icon;
  String title;
  String subTitle;
  String route;
  String routeAfterLogin;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Gap(50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: SvgPicture.asset(widget.icon),
                      ),
                      Gap(10),
                      Text(
                        widget.title,
                        style: AppFontStyles.getSize18(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Gap(20),
                  const Text(
                    'Welcome back!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF19C37D),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.subTitle,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.slateGrayColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  MainTextFormField(
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

                  const SizedBox(height: 40),
                  MainTextFormField(
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

                  Gap(20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        pushWithReplacment(
                          context: context,
                          route: Routes.forgetPassword,
                        );
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Color(0xFF19C37D),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  MainButton(
                    buttonText: ' Login',
                    onPressed: () {
                      pushAndRemoveUntil(
                        context: context,
                        route: widget.routeAfterLogin,
                      );
                    },
                  ),
                  Gap(50),
                  Row(
                    children: [
                      Expanded(
                        child: CardLoginWith(
                          title: 'Facebook',
                          icon: AppImages.facebookLogoSVG,
                        ),
                      ),
                      Gap(10),
                      Expanded(
                        child: CardLoginWith(
                          title: 'Google',
                          icon: AppImages.googleLogoSVG,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ", style: TextStyle(fontSize: 17)),
                GestureDetector(
                  onTap: () {
                    pushWithReplacment(context: context, route: widget.route);
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      color: Color(0xFF19C37D),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
