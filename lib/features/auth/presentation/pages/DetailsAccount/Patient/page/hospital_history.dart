import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Patient/widgets/star_rating.dart';

class HospitalHistory extends StatefulWidget {
  const HospitalHistory({super.key});

  @override
  State<HospitalHistory> createState() => _HospitalHistoryState();
}

class _HospitalHistoryState extends State<HospitalHistory> {
  final List<int> ratings = List.filled(3, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hospital History'),
        elevation: 10,
        shadowColor: AppColors.darkGreyColor.withValues(alpha: .3),
      ),
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
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.blackColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 100,
                    height: 100,
                  ),
                  Gap(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(3),
                        Text("Hospital name", style: AppFontStyles.getSize18()),
                        const Gap(5),
                        Text(
                          "Hospital Address",
                          style: AppFontStyles.getSize16(),
                        ),
                        const Gap(8),
                        StarRating(
                          rating: ratings[index],
                          onRatingChanged: (newRating) {
                            setState(() {
                              ratings[index] = newRating;
                            });
                          },
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
          itemCount: 3,
        ),
      ),
    );
  }
}
