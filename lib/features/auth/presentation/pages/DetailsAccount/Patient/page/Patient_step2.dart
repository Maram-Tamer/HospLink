import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-cubit.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-state.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/widget/steps_card.dart';

class PatientStep2 extends StatelessWidget {
  const PatientStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(title: 'Step 2 of 3'),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = context.read<AuthCubit>();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: cubit.formKey2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StepsCard(
                      context: context,
                      step: 2,
                    ),
                    Gap(30),
                    Text(
                      'National ID',
                      style: AppFontStyles.getSize14(
                        fontWeight: FontWeight.w600,
                        fontColor: AppColors.primaryGreenColor,
                      ),
                    ),
                    Gap(20),
                    MainTextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter National ID';
                        }
                      },
                      inputFormat: [
                        FilteringTextInputFormatter.deny(' '),
                        LengthLimitingTextInputFormatter(14),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: cubit.nationalIDController,
                      prefixIcon: AppIcons.ID_SVG,
                      label: 'National ID',
                      ispassword: false,
                      colorFill: AppColors.fillTextForm,
                    ),
                    Gap(20),
                    Text(
                      'Phone',
                      style: AppFontStyles.getSize14(
                        fontWeight: FontWeight.w600,
                        fontColor: AppColors.primaryGreenColor,
                      ),
                    ),
                    Gap(20),
                    MainTextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter Phone';
                        }
                      },
                      inputFormat: [
                        FilteringTextInputFormatter.deny(' '),
                        LengthLimitingTextInputFormatter(11),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: cubit.phoneController,
                      prefixIcon: AppIcons.callSVG,
                      label: 'Phone',
                      ispassword: false,
                      colorFill: AppColors.fillTextForm,
                    ),
                    Gap(20),
                    Text(
                      'Address',
                      style: AppFontStyles.getSize14(
                        fontWeight: FontWeight.w600,
                        fontColor: AppColors.primaryGreenColor,
                      ),
                    ),
                    Gap(20),
                    MainTextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter Address';
                        }
                      },
                      controller: cubit.addressController,
                      prefixIcon: AppIcons.locationLine_SVG,
                      label: 'Address',
                      ispassword: false,
                      colorFill: AppColors.fillTextForm,
                    ),
                    Gap(20),
                    Divider(
                      thickness: .5,
                      color: AppColors.darkGreyColor,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Center(
                      child: Text(
                        'Please enter contact details to send a message to in case of emergency.',
                        style: AppFontStyles.getSize14(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gap(10),
                    Text(
                      'Name of contact details',
                      style: AppFontStyles.getSize14(
                        fontWeight: FontWeight.w600,
                        fontColor: AppColors.primaryGreenColor,
                      ),
                    ),
                    Gap(20),
                    MainTextFormField(
                      controller: cubit.nameFriendController,
                      prefixIcon: AppIcons.profileSVG,
                      label: 'Name',
                      ispassword: false,
                      colorFill: AppColors.fillTextForm,
                    ),
                    Gap(20),
                    Text(
                      'Phone of contact details',
                      style: AppFontStyles.getSize14(
                        fontWeight: FontWeight.w600,
                        fontColor: AppColors.primaryGreenColor,
                      ),
                    ),
                    Gap(20),
                    MainTextFormField(
                      keyboardType: TextInputType.number,
                      inputFormat: [
                        FilteringTextInputFormatter.deny(' '),
                        LengthLimitingTextInputFormatter(11),
                        FilteringTextInputFormatter.digitsOnly,
                      ],

                      controller: cubit.phoneFriendController,
                      prefixIcon: AppIcons.callSVG,
                      // sufixIcon: AppIcons.connectSVG,
                      label: 'Phone',
                      ispassword: false,
                      colorFill: AppColors.fillTextForm,
                    ),
                    Gap(20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
