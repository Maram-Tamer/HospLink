import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/ScrrenBackgroung/background.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/core/extentions/show_dialoges.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-cubit.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-state.dart';

class ForgetPasswordMailSent extends StatelessWidget {
  const ForgetPasswordMailSent({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthCubit>(context);
    return AppBackground(
      child: Scaffold(
        appBar: App_Bar(leading: true,),
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                 if (state is AuthErrorState) {
                pop(context);
                showMyDialog(context, state.error);
              }else if (state is AuthLoadingState) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryGreenColor,
                    ),
                  ),
                );
              }else if (state is AuthSuccessState) {
                pop(context);
                print('success');
                showMyDialog(context,'Email sent successfully',type: DialogType.success);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Email sent successfully",
                    style: AppFontStyles.getSize32(fontWeight: FontWeight.w500),
                  ),
                  Gap(15),
                  Text(
                    style: AppFontStyles.getSize18(
                      fontColor: AppColors.slateGrayColor,
                    ),
                    "Go to your email to reset your password",
                  ),
                  Gap(50),
                  Center(
                    child: MainButton(
                      buttonText: "Reset Email",
                      onPressed: (){
                        cubit.emailController.text = email;
                        cubit.resetPassword();
                      },
                      width: 295,
                    ),
                  ),
                  Gap(15),
                  Center(
                    child: MainButton(
                      buttonText: "Go to Login",
                      onPressed: (){
                        pushWithReplacment(context: context, route: Routes.welcom);
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