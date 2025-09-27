import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class Hospital_Step2 extends StatelessWidget {
  const Hospital_Step2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Phone 1',
              style: AppFontStyles.getSize18(
                fontWeight: FontWeight.w600,
                fontColor: AppColors.primaryGreenColor,
              ),
            ),
            Gap(20),

            Directionality(
              textDirection: TextDirection.ltr,

              child: MainTextFormField(
                prefixIcon: AppIcons.callSVG,

                label: 'Phone 1',
                ispassword: false,
                colorFill: AppColors.fillTextForm,
              ),
            ),
            Gap(20),
            Text(
              'Phone 2',
              style: AppFontStyles.getSize18(
                fontWeight: FontWeight.w600,
                fontColor: AppColors.primaryGreenColor,
              ),
            ),
            Gap(20),

            Directionality(
              textDirection: TextDirection.ltr,

              child: MainTextFormField(
                prefixIcon: AppIcons.callSVG,

                label: 'Phone 2',
                ispassword: false,
                colorFill: AppColors.fillTextForm,
              ),
            ),
            Gap(20),
            Text(
              'Address',
              style: AppFontStyles.getSize18(
                fontWeight: FontWeight.w600,
                fontColor: AppColors.primaryGreenColor,
              ),
            ),
            Gap(20),

            Directionality(
              textDirection: TextDirection.ltr,

              child: MainTextFormField(
                prefixIcon: AppIcons.locationLine_SVG,

                label: 'Address',
                ispassword: false,
                colorFill: AppColors.fillTextForm,
              ),
            ),
            Gap(20),
            Text(
              'Official Email',
              style: AppFontStyles.getSize18(
                fontWeight: FontWeight.w600,
                fontColor: AppColors.primaryGreenColor,
              ),
            ),
            Gap(20),

            Directionality(
              textDirection: TextDirection.ltr,

              child: MainTextFormField(
                prefixIcon: AppIcons.emailSVG,

                label: 'Official Email',
                ispassword: false,
                colorFill: AppColors.fillTextForm,
              ),
            ),
            Gap(20),
            Text(
              'ID number',
              style: AppFontStyles.getSize18(
                fontWeight: FontWeight.w600,
                fontColor: AppColors.primaryGreenColor,
              ),
            ),
            Gap(20),

            Directionality(
              textDirection: TextDirection.ltr,

              child: MainTextFormField(
                prefixIcon: AppIcons.ID_SVG,
                label: 'ID number',
                ispassword: false,
                colorFill: AppColors.fillTextForm,
              ),
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
