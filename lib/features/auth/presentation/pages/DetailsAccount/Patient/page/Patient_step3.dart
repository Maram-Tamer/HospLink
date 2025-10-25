import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:group_button/group_button.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/widget/bottom_navigation.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/widget/steps_card.dart';

class Patient_Step3 extends StatefulWidget {
  const Patient_Step3({super.key});

  @override
  State<Patient_Step3> createState() => _Patient_Step3State();
}

class _Patient_Step3State extends State<Patient_Step3> {

  final controller = GroupButtonController();
  final List<String> chronicDiseases = [
    "Diabetes",
    "Hypertension",
    "Asthma",
    "Heart Disease",
    "Liver Disease",
    "Kidney Disease",
    "Other"
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
      appBar: App_Bar(title: 'Step 3 of 3'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StepsCard(
              context: context,
              step: 3,
            ),
            Gap(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                Gap(5),
                Text(
                  'Determine your blood type.',
                  style: AppFontStyles.getSize16(
                    fontWeight: FontWeight.w600,
                    fontColor: AppColors.primaryGreenColor,
                  ),
                ),
              ],
            ),
            Gap(15),
            GroupButton(
              isRadio: true, 
              buttons: Boold,
              options: const GroupButtonOptions(
                spacing: 10,
                runSpacing: 10,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                selectedColor: AppColors.primaryGreenColor, // لون عند التحديد
                unselectedColor: Colors.white,
                selectedTextStyle: TextStyle(color: Colors.white),
                unselectedTextStyle: TextStyle(color: Colors.black),
              ),
              onSelected: (value, index, isSelected) {},
            ),
            Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset(
                    AppIcons.sick,
                    color: AppColors.primaryGreenColor,
                  ),
                ),
                Gap(5),
                Text(
                  'Do you have any chronic illnesses?',
                  style: AppFontStyles.getSize16(
                    fontColor: AppColors.primaryGreenColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Gap(15),
            GroupButton(
              isRadio: false, 
              buttons: chronicDiseases,
              options: const GroupButtonOptions(
                spacing: 10,
                runSpacing: 10,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                selectedColor: AppColors.primaryGreenColor, // لون عند التحديد
                unselectedColor: Colors.white,
                selectedTextStyle: TextStyle(color: Colors.white),
                unselectedTextStyle: TextStyle(color: Colors.black),
              ),
              onSelected: (value, index, isSelected) {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigation(
        step: 3,
        route: Routes.login_P,
      ),
    );
  }

  
}
