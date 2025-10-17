import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Patient/hospital_data/presentation/widgets/hospital_detail_tile.dart';

class PatientDetailsList extends StatelessWidget {
  const PatientDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "How do you describe a patient person?The Benefits of Being a Patient Person - MindfulHaving patience means being able to wait calmly in the face of frustration or adversity, so anywhere there is frustration or adversity—i.e., nearly everywhere—we have the opportunity to practice it. A patient person is able to wait calmly in the face of frustration or adversity",
          style: AppFontStyles.getSize16(fontColor: AppColors.darkGreyColor),
          maxLines: 6,
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(10),
        const Divider(thickness: 1),
        Gap(10),
        // Contact Info
        HospitalDetailsTile(
          text: " DOB: 15/10/2004",
          icon: AppIcons.birthdayIMageNoBgSVG,
        ),
        const Gap(10),
        HospitalDetailsTile(
          text: "Blood Type: O+",
          icon: AppIcons.booldSVG,
          color: AppColors.red,
        ),
        const Gap(15),
        HospitalDetailsTile(
          text: "+20 105645454",
          icon: AppIcons.callFillSVG,
          color: AppColors.green,
        ),
        const Gap(15),
        HospitalDetailsTile(
          text: "San Francisco, CA, USA",
          icon: AppIcons.locationLine_SVG,
          color: AppColors.red,
        ),
        const Gap(15),
        HospitalDetailsTile(
          text: "Female",
          icon: AppIcons.genderIMageNoBgSVG,
          color: AppColors.primaryGreenColor,
        ),
        const Gap(10),
        Divider(),
        Gap(10),
        Text(
          "Patient Condition",
          style: AppFontStyles.getSize18(
            fontColor: AppColors.darkColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Gap(10),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            AppImages.patientPNG,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
