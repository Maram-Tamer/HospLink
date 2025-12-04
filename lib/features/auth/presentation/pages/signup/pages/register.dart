import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/core/extentions/show_dialoges.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/features/auth/data/models/user.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-cubit.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-state.dart';
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
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);
    final theme = Theme.of(context);

    // Theme-aware colors
    final cardColor = theme.colorScheme.surface;
    final primaryColor = theme.colorScheme.primary;

    // Responsive scale
    final width = MediaQuery.of(context).size.width;
    double scale = (width / 430).clamp(0.85, 1.2);

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          showMyDialog(context, state.error);
        } else if (state is AuthSuccessState) {
          pushTo(context: context, route: widget.routeAfterRegister);
        } else if (state is AuthLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => Center(
              child: CircularProgressIndicator(color: primaryColor),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: MainAppBar(
          leading: true,
          color: primaryColor,
          colorIconBack: theme.colorScheme.onPrimary,
        ),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                CurveCard(),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 25 * scale, vertical: 20 * scale),
                  padding: EdgeInsets.symmetric(vertical: 25 * scale),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(30 * scale),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 10 * scale,
                        offset: Offset(0, 5 * scale),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(widget.icon,
                          width: 60 * scale, height: 60 * scale),
                      Gap(20 * scale),
                      TextFormSignup(
                        emailController: cubit.emailController,
                        passwordController: cubit.passwordController,
                        confirmPasswordController:
                            cubit.confirmPasswordController,
                      ),
                      Gap(10 * scale),
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
                            activeColor: primaryColor,
                          ),
                          richText(),
                        ],
                      ),
                      Gap(20 * scale),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15 * scale),
                        child: MainButton(
                          buttonText: 'Sign Up',
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate() &&
                                isChecked &&
                                cubit.passwordController.text ==
                                    cubit.confirmPasswordController.text) {
                              cubit.userType =
                                  (widget.routeAfterRegister ==
                                          Routes.pageviewHospital)
                                      ? UserType.hospital
                                      : UserType.patient;
                              cubit.signup();
                            } else if (!isChecked) {
                              showMyDialog(context,
                                  'Please agree to the privacy and policy.');
                            }
                          },
                          buttomColor: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                CardLoginRegisterWith(
                  widget: widget,
                  title: 'Already have an account?  ',
                  subtitle: 'Login',
                  route: widget.routeLogin,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
