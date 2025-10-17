import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class PatientHistoryScrren extends StatefulWidget {
  const PatientHistoryScrren({super.key});

  @override
  State<PatientHistoryScrren> createState() => _PatientHistoryScrrenState();
}

class _PatientHistoryScrrenState extends State<PatientHistoryScrren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(title: 'Hospital History', leading: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.geyTextform,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        AppImages.PatientPhoto1,

                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Gap(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(3),
                        Text("Patient name", style: AppFontStyles.getSize18()),
                        const Gap(5),
                        Text(
                          "+20 1104796306",
                          style: AppFontStyles.getSize16(),
                        ),
                        const Gap(8),
                        Row(
                          children: [
                            Icon(Icons.star, color: AppColors.yellow, size: 20),
                            Gap(8),
                            Text(
                              "4.8",
                              style: AppFontStyles.getSize14(
                                fontColor: AppColors.darkColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Gap(20),
                            Icon(
                              Icons.date_range,
                              color: AppColors.blue2,
                              size: 20,
                            ),
                            Gap(8),
                            Text(
                              "10/1/2025",
                              style: AppFontStyles.getSize14(
                                fontColor: AppColors.darkColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Gap(10);
          },
          itemCount: 9,
        ),
      ),
    );
  }
}
