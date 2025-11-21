import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Patient/data/model/request-model.dart';
import 'package:medigo/features/Patient/presentation/pages/hospital_data/presentation/widgets/hospital_detail_tile.dart';

class PatientDetailsList extends StatelessWidget {
  const PatientDetailsList({super.key, required this.request});
  final RequestModel request ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${request.description}",
          style: AppFontStyles.getSize16(fontColor: AppColors.darkGreyColor),
          maxLines: 6,
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(10),
        const Divider(thickness: 1),
        Gap(10),
        // Contact Info
        HospitalDetailsTile(
          text: " Age: ${request.age}",
          icon: AppIcons.birthdayIMageNoBgSVG,
        ),
        const Gap(10),
        HospitalDetailsTile(
          text: "Blood Type: ${request.blood}",
          icon: AppIcons.booldSVG,
          color: AppColors.red,
        ),
        const Gap(15),
        HospitalDetailsTile(
          text: "${request.phone}",
          icon: AppIcons.callFillSVG,
          color: AppColors.green,
        ),
        const Gap(15),
        HospitalDetailsTile(
          text: "${request.address}",
          icon: AppIcons.locationLine_SVG,
          color: AppColors.red,
        ),
        const Gap(15),
        HospitalDetailsTile(
          text: "${request.gender}",
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
          child: Image.network(
            request.imageDamagePath??'',
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
