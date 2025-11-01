import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/core/extentions/show_dialoges.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
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
    print(widget.routeAfterRegister);
    var cubit = BlocProvider.of<AuthCubit>(context);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          showMyDialog(context, state.error);
        } else if (state is AuthSuccessState) {
          pushTo(context: context, route: widget.routeAfterRegister);
        } else {
          CircularProgressIndicator(
            color: AppColors.primaryGreenColor,
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
                          emailController: cubit.emailController,
                          passwordController: cubit.passwordController,
                          confirmPasswordController:
                              cubit.confirmPasswordController),
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
                            if (cubit.formKey.currentState!.validate() &&
                                isChecked &&
                                cubit.passwordController.text ==
                                    cubit.confirmPasswordController.text) {
                              cubit.userType = (widget.routeAfterRegister ==
                                      Routes.pageviewHospital)
                                  ? UserType.hospital
                                  : UserType.patient;
                              cubit.signup();
                            } else if (!isChecked) {
                              showMyDialog(context,
                                  'please agrees to the privacy and policy.');
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                CardLogin_RegisterWith(
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
