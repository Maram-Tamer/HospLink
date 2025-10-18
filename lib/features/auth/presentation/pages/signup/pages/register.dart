import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/auth/presentation/widget/card_login__register_with.dart';
import 'package:medigo/features/auth/presentation/widget/curveContaner.dart';

class RegesterScreen extends StatefulWidget {
  const RegesterScreen({
    super.key,
    required this.icon,
    required this.subTitle,
    required this.title,
    required this.routeLogin,
    required this.routeAfterRegister,
  });

  final String icon;
  final String title;
  final String subTitle;
  final String routeLogin;
  final String routeAfterRegister;

  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}

class _RegesterScreenState extends State<RegesterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(
        leading: true,
        color: AppColors.primaryGreenColor,
        colorIconBack: AppColors.whiteColor,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ClipPath(
                clipper: DeepBottomCurve(),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  color: AppColors.primaryGreenColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.logolPNG, width: 120, height: 120),
                      Text(
                        'Media Go!',
                        style: AppFontStyles.getSize32(
                          fontColor: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// الكونتينر الأبيض نصفه فوق  الأخضر
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                padding: const EdgeInsets.symmetric(vertical: 25),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(widget.icon, width: 60, height: 60),
                    const Gap(20),

                    /// Email
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

                    /// Password
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

                    /// Confirm Password
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

                    const Gap(10),

                    /// Checkbox + Privacy Policy
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                          shape: const CircleBorder(),
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'You must accept the ',
                                style: AppFontStyles.getSize14(
                                  fontColor: AppColors.darkGreyColor,
                                ),
                              ),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    padding: EdgeInsets.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  onPressed: () {
                                    pushTo(
                                      context: context,
                                      route: Routes.Privacy,
                                    );
                                  },
                                  child: Text(
                                    'Privacy Policy',
                                    style: TextStyle(
                                      color: AppColors.darkGreyColor,
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),

                    /// Sign Up Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: MainButton(
                        buttonText: 'Sign Up',
                        onPressed: () {
                          pushAndRemoveUntil(
                            context: context,
                            route: widget.routeAfterRegister,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// الجزء السفلي (لديه حساب بالفعل)
      bottomNavigationBar: CardLogin_RegisterWith(
        widget: widget,
        title: 'Already have an account?  ',
        subtitle: 'Login',
        route: widget.routeLogin,
      ),
    );
  }
}
