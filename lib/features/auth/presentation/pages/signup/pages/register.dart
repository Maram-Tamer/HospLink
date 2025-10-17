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
  final bool obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
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
                      height: 500,
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
                      child: Image.asset(AppImages.logolPNG),
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
                  height: 450,
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
                      Gap(5),
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

                            shape: CircleBorder(),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
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
                              ],
                            ),
                          ),
                        ],
                      ),
                      Gap(10),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: MainButton(
                          buttonText: 'Sign Up',
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
      bottomNavigationBar: CardLogin_RegisterWith(
        widget: widget,
        title: 'Already have an account?  ',
        subtitle: 'Login',
        route: widget.routeLogin,
      ),
    );
  }
}
