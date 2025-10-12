import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart' as intl;
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

enum Gender { male, female }

class HospitalStep1 extends StatefulWidget {
  const HospitalStep1({super.key});

  @override
  State<HospitalStep1> createState() => HospitalStep1State();
}

class HospitalStep1State extends State<HospitalStep1> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Steps_1(context),
            Gap(30),

            ImageProfile(),
            Spacer(flex: 2),
            Text(
              'Hospital Name',
              style: AppFontStyles.getSize14(
                fontWeight: FontWeight.w600,
                fontColor: AppColors.primaryGreenColor,
              ),
            ),
            Gap(10),

            MainTextFormField(
              label: 'Name',
              ispassword: false,
              colorFill: AppColors.fillTextForm,
            ),
            Spacer(),

            SelectDate(context),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                Gap(5),
                Text(
                  'Hospital type',
                  style: AppFontStyles.getSize14(
                    fontWeight: FontWeight.w600,
                    fontColor: AppColors.primaryGreenColor,
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
                    route: Routes.Hospital_Step_2,
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

  Column SelectDate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Date of Establishment',
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
            hint: Text(' Click To Select Date'),
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

  Row Steps_1(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 10,
          width: MediaQuery.of(context).size.width / 3.33,
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

  Column RadioButtomGroup() {
    return Column(
      children: [
        //Spacer(),
        RadioItem('Public Hospital', 1),
        Gap(15),
        RadioItem('Private Hospital', 2),
        Gap(15),

        RadioItem('University Hospital', 3),
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
          radius: 9,
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
