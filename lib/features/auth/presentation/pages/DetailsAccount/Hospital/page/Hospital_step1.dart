import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart' as intl;
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

enum Gender { Male, Female }

class Hospital_Step1 extends StatefulWidget {
  const Hospital_Step1({super.key});

  @override
  State<Hospital_Step1> createState() => _Hospital_Step1State();
}

class _Hospital_Step1State extends State<Hospital_Step1> {
  final Gender _radioSelected = Gender.Male;
  int? _groupValueGender = 1;
  TextEditingController dateSelected = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ImageProfile(),
            Spacer(flex: 2),
            Text(
              'Hospital Name',
              style: AppFontStyles.getSize18(
                fontWeight: FontWeight.w600,
                fontColor: AppColors.primaryGreenColor,
              ),
            ),
            Gap(10),

            Directionality(
              textDirection: TextDirection.ltr,

              child: MainTextFormField(
                label: 'Name',
                ispassword: false,
                colorFill: AppColors.fillTextForm,
              ),
            ),
            Spacer(),

            SelectDate(context),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Hospital type',
                  style: AppFontStyles.getSize18(
                    fontWeight: FontWeight.w600,
                    fontColor: AppColors.primaryGreenColor,
                  ),
                ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: SvgPicture.asset(
                    AppIcons.hospitalLoginSVG,
                    colorFilter: ColorFilter.mode(
                      AppColors.primaryGreenColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
            Gap(15),
            RadioButtomGroup(),
            Spacer(flex: 5),
          ],
        ),
      ),
    );
  }

  Column SelectDate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Date of Establishment',
            style: AppFontStyles.getSize18(
              fontWeight: FontWeight.w600,
              fontColor: AppColors.primaryGreenColor,
            ),
          ),
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: TextFormField(
            onTap: () async {
              var selectDate = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                initialDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 365 * 3)),
              );
              if (selectDate != null) {
                setState(() {
                  dateSelected.text = intl.DateFormat(
                    "yyyy-MM-dd",
                  ).format(selectDate);
                });
              }
            },

            readOnly: true,
            controller: dateSelected,
            decoration: InputDecoration(
              hint: Text(' Click To Select Date'),
              filled: true, // ← تفعيل تعبئة اللون
              fillColor: AppColors.fillTextForm, // ←
              suffixIcon: Icon(
                Icons.calendar_month_sharp,
                color: AppColors.primaryGreenColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Center ImageProfile() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 81,
            backgroundColor: AppColors.primaryGreenColor,
            child: CircleAvatar(
              radius: 80,
              backgroundColor: AppColors.whiteColor,
              child: SvgPicture.asset(
                AppIcons.hospitalHomeActiveSVG, // ملف الـ SVG
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 5,
            bottom: 5,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: AppColors.fillTextForm,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(Icons.camera_alt, color: AppColors.primaryGreenColor),
            ),
          ),
        ],
      ),
    );
  }

  Column RadioButtomGroup() {
    return Column(
      children: [
        //Spacer(),
        Directionality(
          textDirection: TextDirection.ltr,
          child: RadioItem('Public Hospital', 1),
        ),
        Gap(15),
        Directionality(
          textDirection: TextDirection.ltr,
          child: RadioItem('Private Hospital', 2),
        ),
        Gap(15),

        Directionality(
          textDirection: TextDirection.ltr,
          child: RadioItem('University Hospital', 3),
        ),
        Gap(15),

        //Spacer(),
      ],
    );
  }

  Row RadioItem(String title, int value) {
    return Row(
      children: [
        EasyRadio<int>(
          dotColor: AppColors.primaryGreenColor,
          activeBorderColor: AppColors.primaryGreenColor,
          inactiveBorderColor: AppColors.greyColor,
          value: value,
          groupValue: _groupValueGender,
          onChanged: (value) {
            setState(() {
              _groupValueGender = value;
            });
          },
        ),
        Gap(10),
        Text(
          title,
          style: AppFontStyles.getSize16(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
