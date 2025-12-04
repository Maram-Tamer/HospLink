import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Patient/data/model/request-model.dart';

class PatientCardForHospitalHome extends StatelessWidget {
  const PatientCardForHospitalHome({
    super.key,
    required this.request,
  });

  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;
    final secondaryColor = theme.textTheme.bodySmall?.color ?? Colors.grey;

    return GestureDetector(
      onTap: () {
        pushTo(
          context: context,
          route: Routes.PatientDetails,
          extra: {'request': request, 'isAccepted': false},
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
              backgroundImage: NetworkImage(
                request.imageProfilePath ?? AppImages.PatientPhoto1,
              ),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    request.name ?? '',
                    style: AppFontStyles.getSize16(
                      fontWeight: FontWeight.w600,
                      fontColor: textColor,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    request.address ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFontStyles.getSize14(
                      fontWeight: FontWeight.w500,
                      fontColor: secondaryColor,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    'Phone: ${request.phone ?? ''}',
                    style: AppFontStyles.getSize14(
                      fontWeight: FontWeight.w500,
                      fontColor: secondaryColor,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    'Age: ${request.age ?? ''}',
                    style: AppFontStyles.getSize14(
                      fontWeight: FontWeight.w500,
                      fontColor: secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
