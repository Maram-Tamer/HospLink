import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/core/utils/colors.dart';

class StepsCard extends StatelessWidget {
   StepsCard({
    super.key,
    required this.context,
    required this.step
  });

  final BuildContext context;
  int step;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: (step==1)?10:5,
          width: MediaQuery.of(context).size.width / 3.5,
          decoration: BoxDecoration(
            color: AppColors.primaryGreenColor,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Gap(3),
        Container(
          height:(step==2)?10: 5,
          width: MediaQuery.of(context).size.width / 3.37,
          decoration: BoxDecoration(
            color: (step>1)?AppColors.primaryGreenColor:AppColors.greyColor,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Gap(3),
        Container(
          height: (step==3)?10:5,
          width: MediaQuery.of(context).size.width / 3.37,
          decoration: BoxDecoration(
            color: (step==3)?AppColors.primaryGreenColor:AppColors.greyColor,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ],
    );
  }
}
