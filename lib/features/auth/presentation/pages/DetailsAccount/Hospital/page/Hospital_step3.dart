import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/widget/bottom_navigation.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/widget/steps_card.dart';

class Hospital_Step3 extends StatefulWidget {
  const Hospital_Step3({super.key});
  @override
  State<Hospital_Step3> createState() => _Hospital_Step3State();
}

class _Hospital_Step3State extends State<Hospital_Step3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: App_Bar(title: 'Step 3 of 3'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                StepsCard(
                  context: context,
                  step: 3,
                ),
                Gap(30),
                Text(
                  'Website',
                  style: AppFontStyles.getSize18(
                    fontWeight: FontWeight.w600,
                    fontColor: AppColors.primaryGreenColor,
                  ),
                ),
                Gap(20),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.fillTextForm,
                    labelStyle: TextStyle(color: AppColors.darkGreyColor),
                    hintStyle: AppFontStyles.getSize14(
                      fontColor: AppColors.greyColor,
                    ),
                    hintText: "https://example.com",
                    prefixIcon: Icon(
                      Icons.language,
                      color: AppColors.primaryGreenColor,
                    ),
                  ),
                  keyboardType: TextInputType.url,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter hospital website";
                    }
                    final pattern =
                        r'^(http|https):\/\/[a-zA-Z0-9\-\.]+\.[a-z]{2,}';
                    if (!RegExp(pattern).hasMatch(value)) {
                      return "Enter a valid website URL";
                    }
                    return null;
                  },
                ),
                Gap(20),
                Text(
                  'Description',
                  style: AppFontStyles.getSize18(
                    fontWeight: FontWeight.w600,
                    fontColor: AppColors.primaryGreenColor,
                  ),
                ),
                Gap(20),
                MainTextFormField(
                  maxTextLines: 4,
                  label: 'Description',
                  ispassword: false,
                  colorFill: AppColors.fillTextForm,
                ),
                Gap(20),
                Text(
                  "Upload the official document from the hospital.",
                  style: AppFontStyles.getSize16(
                    fontColor: AppColors.primaryGreenColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DottedBorder(
                    color: AppColors.greyColor,
                    strokeWidth: 1,
                    dashPattern: [5, 3],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(8),
                    child: GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        width: double.infinity,
                        height: 140,
                        child: Container(
                          decoration:
                              BoxDecoration(color: AppColors.fillTextForm),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "click to select file",
                                style: AppFontStyles.getSize16(
                                  fontColor: AppColors.darkGreyColor,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SvgPicture.asset(
                                AppIcons.fileSVG,
                                width: 50,
                                height: 50,
                                fit: BoxFit.contain,
                                colorFilter: ColorFilter.mode(
                                  AppColors.darkGreyColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DottedBorder(
                    color: AppColors.greyColor,
                    strokeWidth: 1,
                    dashPattern: [5, 3],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(8),
                    child: GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        width: double.infinity,
                        height: 130,
                        child: Container(
                          decoration:
                              BoxDecoration(color: AppColors.fillTextForm),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "click to set Location",
                                style: AppFontStyles.getSize16(
                                  fontColor: AppColors.darkGreyColor,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SvgPicture.asset(
                                AppIcons.locationLine_SVG,
                                width: 50,
                                height: 50,
                                fit: BoxFit.contain,
                                colorFilter: ColorFilter.mode(
                                  AppColors.darkGreyColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigation(
          route: Routes.login_H,
          step: 3,
        ));
  }
}

Row steps_3(BuildContext context) {
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
        height: 5,
        width: MediaQuery.of(context).size.width / 3.37,
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
    ],
  );
}
