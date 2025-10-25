import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class ResetPassBody extends StatelessWidget {
  const ResetPassBody({super.key, required this.route});
  final String route;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reset Password",
              style: AppFontStyles.getSize32(fontWeight: FontWeight.w500),
            ),
            Gap(15),
            Text(
              style: AppFontStyles.getSize14(
                fontColor: AppColors.slateGrayColor,
              ),
              "Set the new password for your account so you can login and access all the features.",
            ),
            Gap(45),
            MainTextFormField(label: "New Password", ispassword: true),
            Gap(20),
            MainTextFormField(label: "Confirm Password", ispassword: true),
            Gap(60),
            Center(
              child: MainButton(
                buttonText: "Update Password",
                onPressed: () {
                  pushAndRemoveUntil(context: context, route: Routes.welcom);
                  pushTo(context: context, route: route);
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
