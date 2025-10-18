import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/auth/presentation/pages/forget_password/widgets/otp_input_fields.dart';

class OTPverficationBody extends StatelessWidget {
  const OTPverficationBody({super.key,required this.route});
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
              "Enter 4 Digits Code",
              style: AppFontStyles.getSize32(fontWeight: FontWeight.w500),
            ),
            Gap(20),
            Text(
              "Enter the 4 digits code that you received onyour email.",
              style: AppFontStyles.getSize16(
                fontColor: AppColors.slateGrayColor,
              ),
            ),
            Gap(40),
            OtpInputFields(),
            Gap(40),
            Center(
              child: MainButton(
                buttonText: "Continue",
                onPressed: () {
                  pushWithReplacment(
                    context: context,
                    route: Routes.resetPassword,
                    extra: route
                  );
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
