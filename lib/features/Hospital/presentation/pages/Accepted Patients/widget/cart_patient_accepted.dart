import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Hospital/presentation/pages/Accepted%20Patients/widget/item_patient_accepted.dart';
import 'package:medigo/features/Patient/data/model/request-model.dart';

class CartPatientAccepted extends StatelessWidget {
  const CartPatientAccepted({super.key, required this.request});
  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color ?? AppColors.blackColor;
    final secondaryColor = theme.textTheme.bodySmall?.color ?? AppColors.greyColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: () {
          pushTo(
            context: context,
            route: Routes.PatientDetails,
            extra: {'request': request, 'isAccepted': true},
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row: Avatar + Name + Age
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 43,
                      backgroundColor: AppColors.blueLight,
                      backgroundImage: NetworkImage(
                        request.imageProfilePath ?? AppImages.PatientPhoto3,
                      ),
                    ),
                    const Gap(12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            request.name ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppFontStyles.getSize18(
                              fontWeight: FontWeight.w600,
                              fontColor: textColor,
                            ),
                          ),
                          const Gap(5),
                          Text(
                            '${request.age} years old',
                            style: AppFontStyles.getSize14(
                              fontWeight: FontWeight.w400,
                              fontColor: secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Address
              ItemPatientAccepted(
                maxLine: 2,
                title: request.address ?? '',
                icon: AppIcons.locationLine_SVG,
              ),

              // Other Info (Blood, ID, Phone)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 5,
                  children: [
                    ItemPatientAccepted(
                      title: request.blood ?? '',
                      icon: AppIcons.booldSVG,
                    ),
                    ItemPatientAccepted(
                      title: request.nationalID ?? '',
                      icon: AppIcons.ID_SVG,
                    ),
                    ItemPatientAccepted(
                      title: request.phone ?? '',
                      icon: AppIcons.callSVG,
                    ),
                  ],
                ),
              ),

              // Divider
              const Gap(8),
              Divider(
                color: secondaryColor.withOpacity(0.4),
                indent: 16,
                endIndent: 16,
                thickness: 0.5,
              ),
              const Gap(8),

              // Description
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  request.description ?? '',
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: AppFontStyles.getSize14(
                    fontColor: secondaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
