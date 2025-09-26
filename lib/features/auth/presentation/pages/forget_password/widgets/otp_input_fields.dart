import 'package:flutter/material.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart'
    show PinCodeTextField, PinTheme, PinCodeFieldShape;

class OtpInputFields extends StatelessWidget {
  const OtpInputFields({super.key, this.validator});
  final String? Function(String?)? validator;
  // final TextEditingController? oTPcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      validator: validator,
      //controller: oTPcontroller,
      appContext: context,
      length: 4,
      obscureText: false,
      backgroundColor: Colors.transparent,
      keyboardType: TextInputType.number,
      cursorColor: AppColors.primaryGreenColor,
      enableActiveFill: true,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 60,
        fieldWidth: 70,
        activeColor: AppColors.primaryGreenColor,
        selectedColor: AppColors.primaryGreenColor,
        inactiveColor: AppColors.greyColor,
        activeFillColor: AppColors.whiteColor,
        inactiveFillColor: Colors.transparent,
        selectedFillColor: AppColors.whiteColor,
      ),
    );
  }
}
