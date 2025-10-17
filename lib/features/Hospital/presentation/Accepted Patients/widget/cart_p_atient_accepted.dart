import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Hospital/presentation/Accepted%20Patients/page/accepted_Patients.dart';
import 'package:medigo/features/Hospital/presentation/Accepted%20Patients/widget/item_patient_accepted.dart';

class cartPAtientAccepted extends StatelessWidget {
  const cartPAtientAccepted({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(50),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 43,
                    backgroundColor: AppColors.blueLight,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColors.blue2,
                      child: Image.asset(AppImages.PatientPhoto3),
                    ),
                  ),
                  Gap(10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          'Ahmed Ali Mohamed  ',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: AppFontStyles.getSize18(
                            fontWeight: FontWeight.w600,
                            fontColor: AppColors.blackColor,
                          ),
                        ),
                      ),
                      Gap(10),
                      Text(
                        '25 years old ',
                        style: AppFontStyles.getSize14(
                          fontWeight: FontWeight.w400,
                          fontColor: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColors.red2,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'High',
                        style: AppFontStyles.getSize14(
                          fontWeight: FontWeight.w500,
                          fontColor: AppColors.red,
                        ),
                      ),
                    ),
                  ),
                  Gap(20),
                ],
              ),
            ),
            itemPatientAccepted(
              title: 'Egept Cairo street No. 12',
              icon: AppIcons.locationLine_SVG,
            ),
            Row(
              children: [
                itemPatientAccepted(
                  title: '01104796306',
                  icon: AppIcons.callSVG,
                ),
                Gap(20),
                itemPatientAccepted(title: 'O+', icon: AppIcons.booldSVG),
              ],
            ),
            Gap(10),
            Divider(
              color: AppColors.greyColor,
              indent: 20,
              endIndent: 20,
              thickness: .5,
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Description : Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                maxLines: 3,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: AppFontStyles.getSize14(fontColor: AppColors.greyColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
