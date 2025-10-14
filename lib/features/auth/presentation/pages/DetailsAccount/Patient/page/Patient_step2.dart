import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class Patient_Step2 extends StatelessWidget {
  const Patient_Step2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(title: 'Step 2 of 3'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Steps_2(context),
              Gap(30),
              Text(
                'National ID',
                style: AppFontStyles.getSize14(
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.primaryGreenColor,
                ),
              ),
              Gap(20),

              MainTextFormField(
                prefixIcon: AppIcons.ID_SVG,
                label: 'National ID',
                ispassword: false,
                colorFill: AppColors.fillTextForm,
              ),
              Gap(20),
              Text(
                'Phone',
                style: AppFontStyles.getSize14(
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.primaryGreenColor,
                ),
              ),
              Gap(20),

              Directionality(
                textDirection: TextDirection.ltr,

                child: MainTextFormField(
                  prefixIcon: AppIcons.callSVG,

                  label: 'Phone',
                  ispassword: false,
                  colorFill: AppColors.fillTextForm,
                ),
              ),
              Gap(20),
              Text(
                'Address',
                style: AppFontStyles.getSize14(
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.primaryGreenColor,
                ),
              ),
              Gap(20),

              MainTextFormField(
                prefixIcon: AppIcons.locationLine_SVG,

                label: 'Address',
                ispassword: false,
                colorFill: AppColors.fillTextForm,
              ),
              Gap(20),
              Divider(
                thickness: .5,
                color: AppColors.darkGreyColor,
                indent: 20,
                endIndent: 20,
              ),
              Center(
                child: Text(
                  'Please enter contact details to send a message to in case of emergency.',
                  style: AppFontStyles.getSize14(),
                  textAlign: TextAlign.center,
                ),
              ),
              Gap(10),

              Text(
                'Name of contact details',
                style: AppFontStyles.getSize14(
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.primaryGreenColor,
                ),
              ),
              Gap(20),

              MainTextFormField(
                prefixIcon: AppIcons.profileSVG,

                label: 'Name',
                ispassword: false,
                colorFill: AppColors.fillTextForm,
              ),
              Gap(20),

              Text(
                'Phone of contact details',
                style: AppFontStyles.getSize14(
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.primaryGreenColor,
                ),
              ),
              Gap(20),

              MainTextFormField(
                prefixIcon: AppIcons.callSVG,
               // sufixIcon: AppIcons.connectSVG,

                label: 'Phone',
                ispassword: false,
                colorFill: AppColors.fillTextForm,
              ),
              Gap(20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: MainButton(
                  buttonText: 'Back',
                  onPressed: () {
                    pushWithReplacment(
                      context: context,
                      route: Routes.Patient_Step_1,
                    );
                  },
                  height: 45,
                ),
              ),
              Gap(20),
              Expanded(
                child: MainButton(
                  buttonText: 'Next',
                  onPressed: () {
                    pushWithReplacment(
                      context: context,
                      route: Routes.Patient_Step_3,
                    );
                  },
                  height: 45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row Steps_2(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 5,
          width: MediaQuery.of(context).size.width / 3.5,
          decoration: BoxDecoration(
            color: AppColors.primaryGreenColor,

            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Gap(3),
        Container(
          height: 10,
          width: MediaQuery.of(context).size.width / 3.37,
          decoration: BoxDecoration(
            color: AppColors.primaryGreenColor,

            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Gap(3),
        Container(
          height: 5,
          width: MediaQuery.of(context).size.width / 3.37,
          decoration: BoxDecoration(
            color: AppColors.greyColor,

            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ],
    );
  }
}
