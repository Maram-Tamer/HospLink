import 'package:flutter/material.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/features/auth/presentation/pages/Login/widget/card_login.dart';
import 'package:medigo/features/auth/presentation/pages/Login/widget/curve_card.dart';
import 'package:medigo/features/auth/presentation/widget/card_login__register_with.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    required this.icon,
    required this.subTitle,
    required this.title,
    required this.route,
    required this.routeAfterLogin,
    required this.routeForgetPassword,
  });

  final String icon;
  final String title;
  final String subTitle;
  final String route;
  final String routeAfterLogin;
  final String routeForgetPassword;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                ),
                child: CardLogin(
                  widget: widget,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  routeForgetPassword: widget.routeForgetPassword,
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
