
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/extentions/show_dialoges.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-cubit.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-state.dart';

class ForgetBody extends StatelessWidget {
  const ForgetBody({super.key, required this.route});
  final String route;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthCubit>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthErrorState) {
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
            } else if (state is AuthSuccessState) {
              pop(context);
              print('success');
              pushTo(
                  context: context,
                  route: Routes.forgetPasswordMailSent,
                  extra: cubit.emailController.text);
            }
          },
          child: Form(
            key: cubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Forgot password",
                  style: AppFontStyles.getSize32(fontWeight: FontWeight.w500),
                ),
                Gap(15),
                Text(
                  style: AppFontStyles.getSize14(
                    fontColor: AppColors.slateGrayColor,
                  ),
                  "Enter your email for the verification proccesss,we will send 4 digits code to your email.",
                ),
                Gap(45),
                MainTextFormField(
                    ispassword: false,
                    label: "Email",
                    controller: cubit.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    }),
                Gap(80),
                Center(
                  child: MainButton(
                    buttonText: "Continue",
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.resetPassword();
                      }
                    },
                    width: 295,
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
