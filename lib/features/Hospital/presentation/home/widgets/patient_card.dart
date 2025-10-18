import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/fonts.dart';

class PatientCardForHospitalHome extends StatelessWidget {
  const PatientCardForHospitalHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context: context, route: Routes.PatientDetails, extra: false);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.4),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(AppImages.PatientPhoto1),
              ),
              Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Patient Name',
                      style: AppFontStyles.getSize16(
                          fontWeight: FontWeight.w600,
                          fontColor: Colors.black)),
                  Gap(5),
                  Text('123 Main St, City',
                      style:
                          AppFontStyles.getSize14(fontWeight: FontWeight.w500)),
                  Gap(5),
                  Text('Phone: 123-456-7890',
                      style:
                          AppFontStyles.getSize14(fontWeight: FontWeight.w500)),
                  Gap(5),
                  Text('Age: 30',
                      style:
                          AppFontStyles.getSize14(fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
