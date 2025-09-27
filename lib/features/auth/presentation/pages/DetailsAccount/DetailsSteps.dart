import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:medigo/components/ScrrenBackgroung/background.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Hospital/page/Hospital_step1.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Hospital/page/Hospital_step2.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Hospital/page/Hospital_step3.dart';
import 'package:medigo/features/auth/presentation/pages/forget_password/pages/forget_password_screen.dart';
import 'package:simple_flutter_stepper/simple_flutter_stepper.dart';

class Enter_UserData extends StatefulWidget {
  const Enter_UserData({super.key});

  @override
  State<Enter_UserData> createState() => _Enter_UserDataState();
}

class _Enter_UserDataState extends State<Enter_UserData> {
  int currentStep = 0;
  double get screenWidth => MediaQuery.of(context).size.width;
  double get stepWidth => screenWidth / 3.37;
  goToStep(int step) {
    setState(() {
      currentStep = step;
      log('$currentStep');
    });
  }

  getBody(int step) {
    switch (step) {
      case 0:
        return Hospital_Step1();
      case 1:
        return Hospital_Step2();
      case 2:
        return Hospital_Step3();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SimpleFlutterStepper(
                  width: stepWidth,
                  buttonPadding: const EdgeInsets.all(10),
                  nextOnTap: () {
                    if (currentStep == 2) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgetPasswordScreen(),
                        ),
                      );
                    } else {
                      goToStep(currentStep + 1);
                    }
                  },
                  previousOnTap: currentStep > 0
                      ? () => goToStep(currentStep - 1)
                      : () {
                          SizedBox();
                        },
                  itemCount: 3,
                  disableColor: Colors.grey,
                  activeStep: currentStep,
                  textStyle: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  titles: const ['Step 1/3', 'Step 2/3', 'Step 3/3'],
                  duration: const Duration(milliseconds: 500),
                  activeColor: AppColors.primaryGreenColor,
                  hasAppBar: true,
                  centerTitle: true,
                  appBarTitle: const Text('Patient Details Data'),
                  previousButtonTitle: currentStep > 0 ? 'Previous' : null,
                  nextButtonTitle: currentStep == 2 ? 'Done' : 'Next',
                  nextButtonStyle: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreenColor,
                    minimumSize: const Size(140, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  previousButtonStyle: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreenColor,
                    minimumSize: const Size(140, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  nextButtonTextStyle: AppFontStyles.getSize16(
                    fontColor: AppColors.whiteColor,
                  ),
                  previousButtonTextStyle: AppFontStyles.getSize16(
                    fontColor: AppColors.whiteColor,
                  ),

                  bodyChild: getBody(currentStep),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
