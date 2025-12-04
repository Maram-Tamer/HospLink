import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/constatnts/icons.dart';
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
    final theme = Theme.of(context);

    return Scaffold(
      appBar: MainAppBar(title: 'Step 3 of 3'),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = context.read<AuthCubit>();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: cubit.formKey3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StepsCard(
                      context: context,
                      step: 3,
                    ),
                    Gap(30),

                    // WEBSITE
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Website',
                        style: AppFontStyles.getSize18(
                          fontWeight: FontWeight.w600,
                          fontColor: theme.brightness == Brightness.dark
                              ? Colors.white
                              : theme.primaryColor,
                        ),
                      ),
                    ),
                    Gap(20),
                    TextFormField(
                      controller: cubit.websiteController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: theme.inputDecorationTheme.fillColor,
                        labelStyle: TextStyle(
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : theme.colorScheme.onSurface,
                        ),
                        hintStyle: AppFontStyles.getSize14(
                          fontColor: theme.hintColor,
                        ),
                        hintText: "https://example.com",
                        prefixIcon: Icon(
                          Icons.language,
                          color: theme.primaryColor,
                        ),
                      ),
                      style: TextStyle(
                        color: theme.brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black87,
                      ),
                      keyboardType: TextInputType.url,
                    ),
                    Gap(20),

                    // DESCRIPTION
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Description',
                        style: AppFontStyles.getSize18(
                          fontWeight: FontWeight.w600,
                          fontColor: theme.brightness == Brightness.dark
                              ? Colors.white
                              : theme.primaryColor,
                        ),
                      ),
                    ),
                    Gap(20),
                    MainTextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter Description';
                        } else {
                          return null;
                        }
                      },
                      controller: cubit.descriptionController,
                      maxTextLines: 4,
                      label: 'Description',
                      ispassword: false,
                      colorFill: theme.inputDecorationTheme.fillColor,
                      textColor: theme.brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black87,
                    ),
                    Gap(20),

                    // UPLOAD DOCUMENT
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Upload the official document from the hospital.",
                        style: AppFontStyles.getSize16(
                          fontColor: theme.brightness == Brightness.dark
                              ? Colors.white
                              : theme.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Gap(10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DottedBorder(
                        color: theme.dividerColor,
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
                              decoration: BoxDecoration(
                                color: theme.inputDecorationTheme.fillColor,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    (cubit.filePath == null)
                                        ? "click to select file"
                                        : cubit.filePath!.split('/').last,
                                    style: AppFontStyles.getSize16(
                                      fontColor: (cubit.filePath == null)
                                          ? theme.disabledColor
                                          : theme.colorScheme.error,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SvgPicture.asset(
                                    AppIcons.fileSVG,
                                    width: 50,
                                    height: 50,
                                    colorFilter: ColorFilter.mode(
                                      (cubit.filePath == null)
                                          ? theme.disabledColor
                                          : theme.colorScheme.error,
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

                    // LOCATION PICKER
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Set Hospital Location",
                        style: AppFontStyles.getSize16(
                          fontColor: theme.brightness == Brightness.dark
                              ? Colors.white
                              : theme.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Gap(10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DottedBorder(
                        color: theme.dividerColor,
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
                                color: theme.inputDecorationTheme.fillColor,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    (cubit.positionLati == null)
                                        ? "click to set Location"
                                        : 'Location: ${cubit.positionLong} , ${cubit.positionLati}',
                                    style: AppFontStyles.getSize16(
                                      fontColor: (cubit.positionLati == null)
                                          ? theme.disabledColor
                                          : theme.colorScheme.secondary,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SvgPicture.asset(
                                    AppIcons.locationLine_SVG,
                                    width: 50,
                                    height: 50,
                                    colorFilter: ColorFilter.mode(
                                      (cubit.positionLati == null)
                                          ? theme.disabledColor
                                          : theme.colorScheme.secondary,
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
          content:
              Text('Location services are disabled. Please enable the services'),
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
  final theme = Theme.of(context);
  return Row(
    children: [
      Container(
        height: 5,
        width: MediaQuery.of(context).size.width / 3.5,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      Gap(3),
      Container(
        height: 5,
        width: MediaQuery.of(context).size.width / 3.37,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      Gap(3),
      Container(
        height: 10,
        width: MediaQuery.of(context).size.width / 3.37,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ],
  );
}
