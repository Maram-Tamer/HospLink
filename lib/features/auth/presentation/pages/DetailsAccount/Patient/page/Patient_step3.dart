import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:group_button/group_button.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/core/constatnts/Lists.dart';
import 'package:medigo/core/constatnts/icons.dart';
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
    final primary = Theme.of(context).colorScheme.primary;
    final onSurface = Theme.of(context).colorScheme.onSurface;
    final surface = Theme.of(context).colorScheme.surface;

    return Scaffold(
      appBar: MainAppBar(title: 'Step 3 of 3'),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = context.read<AuthCubit>();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StepsCard(context: context, step: 3),
                Gap(50),

                // ===== Blood Type =====
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: SvgPicture.asset(
                        AppIcons.booldSVG,
                        colorFilter: ColorFilter.mode(primary, BlendMode.srcIn),
                      ),
                    ),
                    Gap(5),
                    Text(
                      'Determine your blood type.',
                      style: AppFontStyles.getSize16(
                        fontWeight: FontWeight.w600,
                        fontColor: primary,
                      ),
                    ),
                  ],
                ),
                Gap(15),

                GroupButton(
                  controller: cubit.booldController,
                  isRadio: true,
                  buttons: Boold,
                  options: GroupButtonOptions(
                    spacing: 10,
                    runSpacing: 10,
                    borderRadius: BorderRadius.circular(8),
                    selectedColor: primary,
                    unselectedColor: surface,
                    selectedTextStyle: TextStyle(color: Colors.white),
                    unselectedTextStyle: TextStyle(color: onSurface),
                  ),
                  onSelected: (value, index, isSelected) {},
                ),

                Gap(30),

                // ===== Chronic Illness =====
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.asset(
                        AppIcons.sick,
                        color: primary,
                      ),
                    ),
                    Gap(5),
                    Text(
                      'Do you have any chronic illnesses?',
                      style: AppFontStyles.getSize16(
                        fontColor: primary,
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
                  options: GroupButtonOptions(
                    spacing: 10,
                    runSpacing: 10,
                    borderRadius: BorderRadius.circular(8),
                    selectedColor: primary,
                    unselectedColor: surface,
                    selectedTextStyle: TextStyle(color: Colors.white),
                    unselectedTextStyle: TextStyle(color: onSurface),
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
