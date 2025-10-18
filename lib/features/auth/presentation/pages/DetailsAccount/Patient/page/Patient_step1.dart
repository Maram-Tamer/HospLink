import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart' as intl;
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

enum Gender { male, female }

class PatientStep1 extends StatefulWidget {
  const PatientStep1({super.key});

  @override
  State<PatientStep1> createState() => PatientStep1State();
}

class PatientStep1State extends State<PatientStep1> {
  final Gender radioSelected = Gender.male;
  int? _groupValueGender = 1;
  TextEditingController dateSelected = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(title: 'Step 1 of 3'),
      //backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Steps_1(context),
                Gap(50),
                ImageProfile(),
                Gap(30),
                Text(
                  'Patient’s Name',
                  style: AppFontStyles.getSize14(
                    fontWeight: FontWeight.w600,
                    fontColor: AppColors.primaryGreenColor,
                  ),
                ),
                Gap(30),

                MainTextFormField(
                  prefixIcon: AppIcons.userSVG,
                  label: 'Name',
                  ispassword: false,
                  colorFill: AppColors.fillTextForm,
                ),
                Gap(30),

                Text(
                  'Gender',
                  style: AppFontStyles.getSize14(
                    fontWeight: FontWeight.w600,
                    fontColor: AppColors.primaryGreenColor,
                  ),
                ),
                Gap(20),
                RadioButtomGroup(),
                Gap(30),
                SelectDate(context),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Gap(20),
              MainButton(
                buttonText: 'Next',
                onPressed: () {
                  pushWithReplacment(
                    context: context,
                    route: Routes.Patient_Step_2,
                  );
                },
                height: 45,
                width: MediaQuery.of(context).size.width / 2 - 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row Steps_1(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 10,
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
            color: AppColors.greyColor,

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

  Center ImageProfile() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 58,
            backgroundColor: AppColors.whiteColor,
            child: const CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage(AppImages.profileWelcom),
            ),
          ),
          Positioned(
            bottom: 3,
            right: 3,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 16,
              child: IconButton(
                icon: const Icon(
                  Icons.camera_alt,
                  size: 16,
                  color: AppColors.primaryGreenColor,
                ),
                onPressed: () {},
              ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Date',
            style: AppFontStyles.getSize14(
              fontWeight: FontWeight.w600,
              fontColor: AppColors.primaryGreenColor,
            ),
          ),
        ),
        TextFormField(
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
              style: AppFontStyles.getSize12(
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
      ],
    );
  }
}
