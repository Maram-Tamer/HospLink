import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:group_button/group_button.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class Patient_Step3 extends StatefulWidget {
  const Patient_Step3({super.key});

  @override
  State<Patient_Step3> createState() => _Patient_Step3State();
}

class _Patient_Step3State extends State<Patient_Step3> {
  int? _groupValue = 1;
  final controller = GroupButtonController();
  final List<String> chronicDiseases = [
    "Diabetes",
    "Hypertension",
    "Asthma",
    "Heart Disease",
    "Liver Disease",
    "Kidney Disease",
  ];
  final List<String> Boold = [
    "I Dont Know",
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                    'Determine your blood type.',
                    style: AppFontStyles.getSize16(
                      fontWeight: FontWeight.w600,
                      fontColor: AppColors.primaryGreenColor,
                    ),
                  ),
                ),
                Gap(5),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: SvgPicture.asset(
                    AppIcons.booldSVG,
                    colorFilter: ColorFilter.mode(
                      AppColors.primaryGreenColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
            Gap(15),

            GroupButton(
              isRadio: true, // ✅ يعني checkbox وليس radio
              buttons: Boold,
              options: const GroupButtonOptions(
                spacing: 10,
                runSpacing: 10,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                selectedColor: Colors.green, // لون عند التحديد
                unselectedColor: Colors.white,
                selectedTextStyle: TextStyle(color: Colors.white),
                unselectedTextStyle: TextStyle(color: Colors.black),
              ),
              onSelected: (value, index, isSelected) {},
            ),
            Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                    'Do you have any chronic illnesses?',
                    style: AppFontStyles.getSize16(
                      fontColor: AppColors.primaryGreenColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Gap(5),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset(
                    AppIcons.sick,
                    color: AppColors.primaryGreenColor,
                  ),
                ),
              ],
            ),
            Gap(15),
            GroupButton(
              isRadio: false, // ✅ يعني checkbox وليس radio
              buttons: chronicDiseases,
              options: const GroupButtonOptions(
                spacing: 10,
                runSpacing: 10,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                selectedColor: Colors.green, // لون عند التحديد
                unselectedColor: Colors.white,
                selectedTextStyle: TextStyle(color: Colors.white),
                unselectedTextStyle: TextStyle(color: Colors.black),
              ),
              onSelected: (value, index, isSelected) {},
            ),
          ],
        ),
      ),
    );
  }

  Row RaidoBloodItem(String title, int value) {
    return Row(
      children: [
        EasyRadio<int>(
          dotColor: AppColors.primaryGreenColor,
          activeBorderColor: AppColors.primaryGreenColor,
          inactiveBorderColor: AppColors.greyColor,
          value: value,
          groupValue: _groupValue,
          onChanged: (value) {
            setState(() {
              _groupValue = value;
            });
          },
        ),
        Gap(10),
        Text(title, style: AppFontStyles.getSize16()),
      ],
    );
  }
}
