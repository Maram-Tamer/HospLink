import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart' as intl;
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/widget/bottom_navigation.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/widget/steps_card.dart';

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StepsCard(context: context, step: 1,),
              Gap(30),
              ImageProfile(),
              Gap(30),
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
              Gap(30),

              SelectDate(context),
              Gap(30),

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
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigation(route: Routes.Hospital_Step_2,step: 1,)
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
            radius: 58,
            backgroundColor: AppColors.whiteColor,
            child: const CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage(AppImages.hospitalPhoto4),
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
