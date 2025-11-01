import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/core/extentions/show_dialoges.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/features/auth/data/models/user.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-cubit.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-state.dart';
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
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthCubit>(context);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          pop(context);
          if (FirebaseAuth.instance.currentUser!.displayName != null) {
            state.userType == UserType.hospital
                ? pushTo(context: context, route: Routes.Main_hospital)
                : pushTo(context: context, route: Routes.Main_patient);
          } else {
            state.userType == UserType.hospital
                ? pushTo(context: context, route: Routes.pageviewHospital)
                : pushTo(context: context, route: Routes.pageviewPatient);
          }
        } else if (state is AuthErrorState) {
          pop(context);
          showMyDialog(context, state.error);
        } else if (state is AuthLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryGreenColor,
              ),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: App_Bar(
          leading: true,
          color: AppColors.primaryGreenColor,
          colorIconBack: AppColors.whiteColor,
        ),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Form(
            key: cubit.formKey,
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
                    emailController: cubit.emailController,
                    passwordController: cubit.passwordController,
                    routeForgetPassword: widget.routeForgetPassword,
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.login();
                      }
                    },
                  ),
                ),
                CardLogin_RegisterWith(
                  widget: widget,
                  title: 'Don\'t have an account?  ',
                  subtitle: 'Sign Up',
                  route: widget.route,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
