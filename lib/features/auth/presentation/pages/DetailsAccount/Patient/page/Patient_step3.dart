import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:group_button/group_button.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/core/constatnts/Lists.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-cubit.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-state.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/widget/steps_card.dart';

class PatientStep3 extends StatefulWidget {
  const PatientStep3({super.key});

  @override
  State<PatientStep3> createState() => _PatientStep3State();
}

class _PatientStep3State extends State<PatientStep3> {
  final controller = GroupButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(title: 'Step 3 of 3'),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = context.read<AuthCubit>();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StepsCard(
                  context: context,
                  step: 3,
                ),
                Gap(50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: SvgPicture.asset(
                        AppIcons.booldSVG,
                        colorFilter: ColorFilter.mode(
                          AppColors.primaryGreenColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Gap(5),
                    Text(
                      'Determine your blood type.',
                      style: AppFontStyles.getSize16(
                        fontWeight: FontWeight.w600,
                        fontColor: AppColors.primaryGreenColor,
                      ),
                    ),
                  ],
                ),
                Gap(15),
                GroupButton(
                  controller: cubit.booldController,
                  isRadio: true,
                  buttons: Boold,
                  options: const GroupButtonOptions(
                    spacing: 10,
                    runSpacing: 10,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    selectedColor:
                        AppColors.primaryGreenColor, // لون عند التحديد
                    unselectedColor: Colors.white,
                    selectedTextStyle: TextStyle(color: Colors.white),
                    unselectedTextStyle: TextStyle(color: Colors.black),
                  ),
                  onSelected: (value, index, isSelected) {},
                ),
                Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.asset(
                        AppIcons.sick,
                        color: AppColors.primaryGreenColor,
                      ),
                    ),
                    Gap(5),
                    Text(
                      'Do you have any chronic illnesses?',
                      style: AppFontStyles.getSize16(
                        fontColor: AppColors.primaryGreenColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Gap(15),
                GroupButton(
                  
                  controller: cubit.illnessesController,
                  isRadio: false,
                  buttons: chronicDiseases,
                  options: const GroupButtonOptions(
                    spacing: 10,
                    runSpacing: 10,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    selectedColor:
                        AppColors.primaryGreenColor, // لون عند التحديد
                    unselectedColor: Colors.white,
                    selectedTextStyle: TextStyle(color: Colors.white),
                    unselectedTextStyle: TextStyle(color: Colors.black),
                  ),
                  onSelected: (value, index, isSelected) {},
                ),
              ],
            ),
          );
        },
      ),
      
    );
  }
}
