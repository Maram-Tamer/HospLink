import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/features/Hospital/presentation/pages/patient_details/presentation/pages/patient_details_screen.dart';

class PatientDetailsTrailing extends StatelessWidget {
  const PatientDetailsTrailing({super.key, required this.widget});

  final PatientDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (widget.isAccepted) ...[
              Expanded(
                child: MainButton(
                  buttonText: "Accepted Case",
                  buttomColor: AppColors.green,
                  onPressed: () {
                    pop(context);
                  },
                  icon: AppIcons.completeSVG,
                ),
              ),
            ] else ...[
              Expanded(
                child: MainButton(
                  buttonText: "Accept Case",
                  buttomColor: AppColors.green,

                  onPressed: () {
                    widget.isAccepted = true;
                    pop(context);
                  },
                  icon: AppIcons.completeSVG,
                ),
              ),
            ],
          ],
        ),
        Gap(10),
        widget.isAccepted
            ? SizedBox(height: 0)
            : Row(
                children: [
                  Expanded(
                    child: MainButton(
                      buttomColor: AppColors.red,
                      buttonText: "Reject Case",
                      width: 300,

                      onPressed: () {
                        pop(context);
                      },
                      icon: AppIcons.deleteSVG,
                    ),
                  ),
                  const Gap(15),
                  GestureDetector(
                    onTap: () {
                      pushTo(context: context, route: Routes.chat);
                    },

                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreenColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        colorFilter: ColorFilter.mode(
                          AppColors.cardColor,
                          BlendMode.srcIn,
                        ),
                        AppIcons.chat2SVG,
                        height: 35,
                      ),
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
