import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/features/Hospital/presentation/patient_details/presentation/pages/patient_details_screen.dart';

class PatientDetailsTrailing extends StatelessWidget {
  const PatientDetailsTrailing({
    super.key,
    required this.widget,
  });

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
                  onPressed: () {},
                  icon: AppIcons.completeSVG,
                ),
              ),
            ] else ...[
              Expanded(
                child: MainButton(
                  buttonText: "Accept Case",
                  onPressed: () {
                    widget.isAccepted = true;
                  },
                  icon: AppIcons.completeSVG,
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
          ],
        ),
        Gap(10),
        widget.isAccepted
            ? SizedBox(height: 0)
            : MainButton(
                buttomColor: AppColors.red,
                buttonText: "Reject Case",
    
                onPressed: () {},
                icon: AppIcons.deleteSVG,
              ),
      ],
    );
  }
}
