import 'dart:io';
import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' as intl;
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/buttons/main_button.dart' show MainButton;
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

class PatientStep1 extends StatefulWidget {
  const PatientStep1({super.key});

  @override
  State<PatientStep1> createState() => PatientStep1State();
}

class PatientStep1State extends State<PatientStep1> {
  final Gender radioSelected = Gender.male;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: MainAppBar(title: 'Step 1 of 3'),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = context.read<AuthCubit>();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: cubit.formKey1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StepsCard(
                        context: context,
                        step: 1,
                      ),
                      Gap(50),
                      imageProfile(cubit, primary),
                      Gap(30),
                      Text(
                        'Patient’s Name',
                        style: AppFontStyles.getSize14(
                          fontWeight: FontWeight.w600,
                          fontColor: primary,
                        ),
                      ),
                      Gap(30),
                      MainTextFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'please enter Name';
                          }
                          return null;
                        },
                        controller: cubit.nameController,
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
                          fontColor: primary,
                        ),
                      ),
                      Gap(20),
                      radioButtomGroup(cubit, primary),
                      Gap(30),
                      selectDate(context, cubit, primary),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Center imageProfile(AuthCubit cubit, Color primary) {
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
                  return SizedBox(
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
                backgroundImage: (cubit.imageUri != null)
                    ? FileImage(File(cubit.imageUri!)) as ImageProvider
                    : AssetImage(AppImages.profileWelcom),
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
                icon: Icon(
                  Icons.camera_alt,
                  size: 16,
                  color: primary,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row radioButtomGroup(AuthCubit cubit, Color primary) {
    return Row(
      children: [
        Spacer(),
        EasyRadio<String>(
          dotColor: primary,
          activeBorderColor: primary,
          inactiveBorderColor: AppColors.greyColor,
          value: 'Male',
          groupValue: cubit.radiGroub,
          onChanged: (value) {
            setState(() {
              cubit.radiGroub = value;
            });
          },
        ),
        Gap(10),
        Text('Male', style: AppFontStyles.getSize16()),
        Spacer(),
        EasyRadio<String>(
          dotColor: primary,
          activeBorderColor: primary,
          inactiveBorderColor: AppColors.greyColor,
          value: 'Femail',
          groupValue: cubit.radiGroub,
          onChanged: (value) {
            setState(() {
              cubit.radiGroub = value;
            });
          },
        ),
        Gap(10),
        Text('Female', style: AppFontStyles.getSize16()),
        Spacer(),
      ],
    );
  }

  Column selectDate(BuildContext context, AuthCubit cubit, Color primary) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Birth Day',
            style: AppFontStyles.getSize14(
              fontWeight: FontWeight.w600,
              fontColor: primary,
            ),
          ),
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'please select your Birth Day';
            }
            return null;
          },
          onTap: () async {
            var selectDate = await showDatePicker(
              context: context,
              firstDate: DateTime.utc(1950),
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
            hint: Text(
              ' Click To Select Date',
              style: AppFontStyles.getSize12(
                fontColor: AppColors.darkGreyColor,
              ),
            ),
            filled: true,
            fillColor: AppColors.fillTextForm,
            suffixIcon: Icon(
              Icons.calendar_month_sharp,
              color: primary,
            ),
          ),
        ),
      ],
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
