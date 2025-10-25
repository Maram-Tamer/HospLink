import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/features/auth/presentation/pages/Login/widget/curve_card.dart';
import 'package:medigo/features/auth/presentation/pages/signup/widget/rich_text.dart';
import 'package:medigo/features/auth/presentation/pages/signup/widget/text_form_signup.dart';
import 'package:medigo/features/auth/presentation/widget/card_login__register_with.dart';

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
              CurveCard(),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                padding: const EdgeInsets.symmetric(vertical: 25),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .1),
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
                    TextFormSignup(
                        emailController: _emailController,
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController),
                    const Gap(10),
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
                        richText(),
                      ],
                    ),
                    const Gap(20),
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
      bottomNavigationBar: CardLogin_RegisterWith(
        widget: widget,
        title: 'Already have an account?  ',
        subtitle: 'Login',
        route: widget.routeLogin,
      ),
    );
  }
}
