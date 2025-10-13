import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/auth/presentation/widget/card_login__register_with.dart';
import 'package:medigo/features/auth/presentation/widget/curveContaner.dart';

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
  final bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: true,
      body: Form(
        key: _formKey,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  ClipPath(
                    clipper: DeepBottomCurve(),
                    child: Container(
                      padding: EdgeInsets.all(0),
                      width: double.infinity,
                      height: 450,
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreenColor,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: MediaQuery.of(context).size.width / 2 - 100,
                child: Column(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset(AppImages.LogolPNG),
                    ),
                    Text(
                      'Media Go!',
                      style: AppFontStyles.getSize32(
                        fontColor: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2 - 200,
                right: 25,
                left: 25,
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(widget.icon),
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
                            final emailRegex = RegExp(
                              r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                            );
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
                        alignment: AlignmentGeometry.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            pushWithReplacment(
                              context: context,
                              route: Routes.forgetPassword,
                            );
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
                      Gap(20),
      
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: MainButton(
                          buttonText: 'Login',
                          onPressed: () {
                            pushAndRemoveUntil(
                              context: context,
                              route: widget.routeAfterLogin,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CardLogin_RegisterWith(
        widget: widget,
        title: 'Don\'t have an account?  ',
        subtitle: 'Sign Up',
        route: widget.route,
      ),
    );
  }
}
