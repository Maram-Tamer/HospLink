import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:group_button/group_button.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class Hospital_Step3 extends StatefulWidget {
  const Hospital_Step3({super.key});

  @override
  State<Hospital_Step3> createState() => _Hospital_Step3State();
}

class _Hospital_Step3State extends State<Hospital_Step3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Gap(30),
            Text(
              'Website',
              style: AppFontStyles.getSize18(
                fontWeight: FontWeight.w600,
                fontColor: AppColors.primaryGreenColor,
              ),
            ),
            Gap(20),

            Directionality(
              textDirection: TextDirection.ltr,

              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.fillTextForm,
                  labelText: "Website",
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
                keyboardType: TextInputType.url, // يفتح كيبورد مناسب للـ URL
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

            Directionality(
              textDirection: TextDirection.ltr,

              child: MainTextFormField(
                maxTextLines: 4,
                label: 'Description',
                ispassword: false,
                colorFill: AppColors.fillTextForm,
              ),
            ),
            Gap(20),
            Directionality(
              textDirection: TextDirection.ltr,

              child: Text(
                "Upload the official document from the hospital.", // النص اللي فوق
                style: AppFontStyles.getSize16(
                  fontColor: AppColors.primaryGreenColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {},
                child: SizedBox(
                  width: double.infinity,
                  height: 140,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.fillTextForm,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.primaryGreenColor),
                    ),
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // توسيط عمودي
                      children: [
                        Text(
                          "click to select file", // النص اللي فوق
                          style: AppFontStyles.getSize16(
                            fontColor: AppColors.darkGreyColor,
                          ),
                        ),
                        const SizedBox(height: 10), // مسافة بين النص والأيقونة
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
          ],
        ),
      ),
    );
  }
}
