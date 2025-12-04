import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Patient/data/model/request-model.dart';
import 'package:medigo/features/Patient/presentation/pages/hospital_data/presentation/widgets/hospital_detail_tile.dart';

class PatientDetailsList extends StatelessWidget {
  const PatientDetailsList({super.key, required this.request});
  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          
          textAlign: TextAlign.left,
          "Description: ${request.description}",
          style: AppFontStyles.getSize16(
            
            fontWeight: FontWeight.w600,
            fontColor: theme.textTheme.bodyLarge?.color ?? Colors.black,
          ),
          maxLines: 6,
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(10),
        Divider(color: theme.dividerColor, thickness: 1),
        const Gap(10),
        // Contact Info
        HospitalDetailsTile(
          text: " Age: ${request.age}",
          icon: AppIcons.birthdayIMageNoBgSVG,
          style: AppFontStyles.getSize16(
            
            fontWeight: FontWeight.w600,
            fontColor: theme.textTheme.bodyLarge?.color ?? Colors.black,
          ),
        ),
        const Gap(10),
        HospitalDetailsTile(
          text: "Blood Type: ${request.blood}",
          icon: AppIcons.booldSVG,
          style: AppFontStyles.getSize16(
            
            fontWeight: FontWeight.w600,
            fontColor: theme.textTheme.bodyLarge?.color ?? Colors.black,
          ), // previously AppColors.red
        ),
        const Gap(15),
        HospitalDetailsTile(
          
          text: "${request.phone}",
          icon: AppIcons.callFillSVG,
          color: theme.colorScheme.secondary, // previously AppColors.green
        ),
        const Gap(15),
        HospitalDetailsTile(
          text: "${request.address}",
          icon: AppIcons.locationLine_SVG,
          color: theme.colorScheme.error, // previously AppColors.red
        ),
        const Gap(15),
        HospitalDetailsTile(
          text: "${request.gender}",
          icon: AppIcons.genderIMageNoBgSVG,
          color: theme.colorScheme.primary, // previously AppColors.primaryGreenColor
        ),
        const Gap(10),
        Divider(color: theme.dividerColor),
        const Gap(10),
        Text(
          "Patient Condition",
          style: AppFontStyles.getSize18(
            fontColor: theme.textTheme.bodyLarge?.color ?? Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(10),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            request.imageDamagePath ?? '',
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
