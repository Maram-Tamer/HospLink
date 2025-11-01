import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/extentions/show_dialoges.dart';
import 'package:medigo/core/extentions/uploadCloudinary.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-cubit.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-state.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/widget/steps_card.dart';

class HospitalStep3 extends StatefulWidget {
  const HospitalStep3({super.key});
  @override
  State<HospitalStep3> createState() => _HospitalStep3State();
}

class _HospitalStep3State extends State<HospitalStep3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(title: 'Step 3 of 3'),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = context.read<AuthCubit>();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: cubit.formKey3,
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
                      controller: cubit.websiteController,
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
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter Description';
                        }
                      },
                      controller: cubit.descriptionController,
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
                          onTap: () async {
                            cubit.upladFile(context);                           
                          },
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
                                    (cubit.filePath == null)
                                        ? "click to select file"
                                        : cubit.filePath!.split('/').last,
                                    style: AppFontStyles.getSize16(
                                      fontColor: (cubit.filePath == null)
                                          ? AppColors.darkGreyColor
                                          : AppColors.red,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SvgPicture.asset(
                                    AppIcons.fileSVG,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.contain,
                                    colorFilter: ColorFilter.mode(
                                      (cubit.filePath == null)
                                          ? AppColors.darkGreyColor
                                          : AppColors.red,
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
                          onTap: () {
                            getCurrentPosition(cubit);
                          },
                          child: SizedBox(
                            width: double.infinity,
                            height: 130,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.fillTextForm),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      (cubit.positionLati == null)
                                          ? "click to set Location"
                                          : 'Location is ${cubit.positionLong} , ${cubit.positionLati}',
                                      style: AppFontStyles.getSize16(
                                        fontColor: (cubit.positionLati == null)
                                            ? AppColors.darkGreyColor
                                            : AppColors.green,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SvgPicture.asset(
                                      AppIcons.locationLine_SVG,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.contain,
                                      colorFilter: ColorFilter.mode(
                                        (cubit.positionLati == null)
                                            ? AppColors.darkGreyColor
                                            : AppColors.green,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> getCurrentPosition(AuthCubit cubit) async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 50,
      ),
    ).then((Position position) {
      cubit.updateLocation(position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Location services are disabled. Please enable the services',
          ),
        ),
      );
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')),
        );
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Location permissions are permanently denied, we cannot request permissions.',
          ),
        ),
      );
      return false;
    }
    return true;
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
