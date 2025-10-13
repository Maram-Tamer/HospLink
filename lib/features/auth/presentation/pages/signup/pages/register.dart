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
import 'package:medigo/features/auth/presentation/widget/card_login__register_with.dart';
import 'package:medigo/features/auth/presentation/widget/curveContaner.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class RegesterScreen extends StatefulWidget {
  RegesterScreen({
    super.key,
    required this.icon,
    required this.subTitle,
    required this.title,
    required this.routeLogin,
    required this.routeAfterRegister,
  });
  String icon;
  String title;
  String subTitle;
  String routeLogin;
  String routeAfterRegister;

  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}

class _RegesterScreenState extends State<RegesterScreen> {
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
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
                        height: 500,
                        decoration: BoxDecoration(
                          color: AppColors.primaryGreenColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 30,
                  right: MediaQuery.of(context).size.width / 2 - 100,
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset(AppImages.LogolPNG),
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
                        Gap(20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: MainTextFormField(
                            label: 'Confirm Password',
                            ispassword: true,
                            controller: _confirmpasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Confirm password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                        ),
                        Gap(20),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: MainButton(
                            buttonText: 'Login',
                            onPressed: () {
                              pushWithReplacment(
                                context: context,
                                route: widget.routeAfterRegister,
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
      ),
      bottomNavigationBar: CardLogin_RegisterWith(
        widget: widget,
        title: 'Already have an account?  ',
        subtitle: 'Login',
        route: widget.routeLogin,
      ),
    );
  }
}
