import 'dart:io';

import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' as intl;
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-cubit.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-state.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/widget/steps_card.dart';

enum Gender { male, female }

class HospitalStep1 extends StatefulWidget {
  const HospitalStep1({super.key});

  @override
  State<HospitalStep1> createState() => HospitalStep1State();
}

class HospitalStep1State extends State<HospitalStep1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(title: 'Step 1 of 3'),
      //backgroundColor: AppColors.whiteColor,
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = context.read<AuthCubit>();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: cubit.formKey1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StepsCard(
                      context: context,
                      step: 1,
                    ),
                    Gap(30),
                    imageProfile(cubit),
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
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter Name';
                        }
                      },
                      controller: cubit.nameController,
                      label: 'Name',
                      ispassword: false,
                      colorFill: AppColors.fillTextForm,
                    ),
                    Gap(30),
                    SelectDate(context, cubit),
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
                    RadioButtomGroup(cubit),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Column SelectDate(BuildContext context, AuthCubit cubit) {
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
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'please enter Date of Establishment';
            }
          },
          onTap: () async {
            var selectDate = await showDatePicker(
              context: context,
              firstDate: DateTime.utc(1900),
              initialDate: DateTime.now(),
              lastDate: DateTime.now(),
            );
            if (selectDate != null) {
              setState(() {
                cubit.dateController.text = intl.DateFormat(
                  "yyyy-MM-dd",
                ).format(selectDate);
              });
            }
          },
          readOnly: true,
          controller: cubit.dateController,
          decoration: InputDecoration(
            hint: Text(' Click To Select Date'),
            filled: true,
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

  Center imageProfile(AuthCubit cubit) {
    return Center(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isDismissible: true,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Container(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: MainButton(
                            buttonText: 'From Camera',
                            onPressed: () async {
                              await pickImage(true, cubit);
                              pop(context);
                            },
                          ),
                        ),
                        Gap(20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: MainButton(
                            buttonText: 'From Gallary',
                            onPressed: () async {
                              await pickImage(false, cubit);
                              pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: CircleAvatar(
              radius: 58,
              backgroundColor: AppColors.whiteColor,
              child: CircleAvatar(
                radius: 55,
                backgroundImage: (cubit.imagFeile != null)
                    ? FileImage(File(cubit.imagFeile!.path)) as ImageProvider
                    : AssetImage(AppImages.hospitalPhoto4),
              ),
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

  Column RadioButtomGroup(AuthCubit cubit) {
    return Column(
      children: [
        //Spacer(),
        RadioItem('Public Hospital', cubit),
        Gap(15),
        RadioItem('Private Hospital', cubit),
        Gap(15),

        RadioItem('University Hospital', cubit),
        Gap(15),

        //Spacer(),
      ],
    );
  }

  RadioItem(String title, AuthCubit cubit) {
    return GestureDetector(
      onTap: () {
        setState(() {
          cubit.radiGroub = title;
        });
      },
      child: Row(
        children: [
          Gap(15),
          EasyRadio<String>(
            dotColor: AppColors.primaryGreenColor,
            activeBorderColor: AppColors.primaryGreenColor,
            inactiveBorderColor: AppColors.greyColor,
            value: title,
            radius: 9,
            groupValue: cubit.radiGroub,
            onChanged: (value) {
              setState(() {
                cubit.radiGroub = value;
              });
            },
          ),
          Gap(15),
          Text(
            title,
            style: AppFontStyles.getSize16(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Future<void> pickImage(bool isCamera, AuthCubit cubit) async {
    final pickedFile = await ImagePicker().pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        cubit.imagFeile = File(pickedFile.path);
        cubit.imageUri = pickedFile.path;
      });
    }
  }
}
