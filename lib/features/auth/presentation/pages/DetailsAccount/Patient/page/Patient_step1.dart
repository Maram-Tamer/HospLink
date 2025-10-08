import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medigo/components/ScrrenBackgroung/background.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:easy_radio/easy_radio.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

enum Gender { Male, Female }

class Patient_Step1 extends StatefulWidget {
  const Patient_Step1({super.key});

  @override
  State<Patient_Step1> createState() => _Patient_Step1State();
}

class _Patient_Step1State extends State<Patient_Step1> {
  final Gender? _radioSelected = Gender.Male;
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
            Gap(30),
            Spacer(),
            Text(
              'Patient’s Name',
              style: AppFontStyles.getSize18(
                fontWeight: FontWeight.w600,
                fontColor: AppColors.primaryGreenColor,
              ),
            ),
            Gap(20),

            Directionality(
              textDirection: TextDirection.ltr,

              child: MainTextFormField(
                prefixIcon: AppIcons.userSVG,
                label: 'Name',
                ispassword: false,
                colorFill: AppColors.fillTextForm,
              ),
            ),
            Gap(20),
            Spacer(),

            Text(
              'Gender',
              style: AppFontStyles.getSize18(fontWeight: FontWeight.w600,fontColor: AppColors.primaryGreenColor,),
            ),
            Gap(10),
            RadioButtomGroup(),
            Spacer(),

            SelectDate(context),
            Spacer(flex: 10),
          ],
        ),
      ),
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
                AppIcons.profileActiveSVG,
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

  Row RadioButtomGroup() {
    return Row(
      children: [
        Spacer(),
        Text('Male', style: AppFontStyles.getSize16()),
        Gap(10),
        EasyRadio<int>(
          dotColor: AppColors.primaryGreenColor,
          activeBorderColor: AppColors.primaryGreenColor,
          inactiveBorderColor: AppColors.greyColor,
          value: 1,
          groupValue: _groupValueGender,
          onChanged: (value) {
            setState(() {
              _groupValueGender = value;
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
          groupValue: _groupValueGender,
          onChanged: (value) {
            setState(() {
              _groupValueGender = value;
            });
          },
        ),
        Spacer(),
      ],
    );
  }

  Column SelectDate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Date',
            style: AppFontStyles.getSize18(fontWeight: FontWeight.w600,fontColor: AppColors.primaryGreenColor),
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
              hint: Text(
                ' Click To Select Date',
                style: AppFontStyles.getSize14(
                  fontColor: AppColors.darkGreyColor,
                ),
              ),

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
}
