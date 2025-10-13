import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart' show Routes;
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class Hospital_Step2 extends StatelessWidget {
  const Hospital_Step2({super.key});

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
                'Phone 1',
                style: AppFontStyles.getSize14(
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.primaryGreenColor,
                ),
              ),
              Gap(20),

              MainTextFormField(
                prefixIcon: AppIcons.callSVG,
              
                label: 'Phone 1',
                ispassword: false,
                colorFill: AppColors.fillTextForm,
              ),
              Gap(20),
              Text(
                'Phone 2',
                style: AppFontStyles.getSize14(
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.primaryGreenColor,
                ),
              ),
              Gap(20),

              MainTextFormField(
                prefixIcon: AppIcons.callSVG,
              
                label: 'Phone 2',
                ispassword: false,
                colorFill: AppColors.fillTextForm,
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
              Text(
                'Official Email',
                style: AppFontStyles.getSize14(
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.primaryGreenColor,
                ),
              ),
              Gap(20),

              MainTextFormField(
                prefixIcon: AppIcons.emailSVG,
              
                label: 'Official Email',
                ispassword: false,
                colorFill: AppColors.fillTextForm,
              ),
              Gap(20),
              Text(
                'ID number',
                style: AppFontStyles.getSize14(
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.primaryGreenColor,
                ),
              ),
              Gap(20),

              MainTextFormField(
                prefixIcon: AppIcons.ID_SVG,
                label: 'ID number',
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
                      route: Routes.Hospital_Step_1,
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
                      route: Routes.Hospital_Step_3,
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
}

Row Steps_2(BuildContext context) {
  return Row(
    children: [
      Container(
        height: 5,
        width: MediaQuery.of(context).size.width / 3.33,
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
