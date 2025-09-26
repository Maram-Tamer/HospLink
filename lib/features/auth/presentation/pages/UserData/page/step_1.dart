import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medigo/components/ScrrenBackgroung/background.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:easy_radio/easy_radio.dart';

enum Gender { Male, Female }

class Step_1 extends StatefulWidget {
  Step_1({super.key});

  @override
  State<Step_1> createState() => _Step_1State();
}

class _Step_1State extends State<Step_1> {
  Gender? _radioSelected = Gender.Male;
  int? _groupValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 60,
              child: Expanded(child: SvgPicture.asset(AppIcons.profileSVG)),
            ),
            Gap(30),
            MainTextFormField(
              label: 'Name',
              ispassword: false,
              colorFill: AppColors.fillTextForm,
            ),
            Gap(20),
            Text(
              'Gender',
              style: AppFontStyles.getSize18(fontWeight: FontWeight.w600),
            ),
            Gap(10),
            Row(
              children: [
                Spacer(),
                Text('Male', style: AppFontStyles.getSize16()),
                Gap(10),
                EasyRadio<int>(
                  dotColor: AppColors.primaryGreenColor,
                  activeBorderColor: AppColors.primaryGreenColor,
                  inactiveBorderColor: AppColors.greyColor,
                  value: 1,
                  groupValue: _groupValue,
                  onChanged: (value) {
                    setState(() {
                      _groupValue = value;
                    });
                  },
                ),
                Spacer(),

                Text('Female', style: AppFontStyles.getSize16()),
                Gap(10),
                EasyRadio<int>(
                  dotColor: AppColors.primaryGreenColor,
                  activeBorderColor: AppColors.primaryGreenColor,
                  inactiveBorderColor: AppColors.greyColor,
                  value: 2,
                  groupValue: _groupValue,
                  onChanged: (value) {
                    setState(() {
                      _groupValue = value;
                    });
                  },
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
