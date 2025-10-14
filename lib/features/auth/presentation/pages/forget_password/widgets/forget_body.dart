import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class ForgetBody extends StatelessWidget {
  const ForgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
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
            MainTextFormField(ispassword: false, label: "Email"),
            Gap(80),
            Center(
              child: MainButton(
                buttonText: "Continue",
                onPressed: () {
                  pushWithReplacment(context: context, route: Routes.oTP);
                },
                width: 295,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
