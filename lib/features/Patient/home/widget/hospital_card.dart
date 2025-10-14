import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class HospitalCard extends StatefulWidget {
  const HospitalCard({super.key, this.submitRequest = false});
  final bool submitRequest;

  @override
  State<HospitalCard> createState() => _HospitalCardState();
}

class _HospitalCardState extends State<HospitalCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context: context, route: Routes.HospitalDetails,extra: false);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      AppImages.hospitalPhoto2,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Gap(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'City Hospital',
                        style: AppFontStyles.getSize16(
                          fontColor: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(5),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.primaryGreenColor,
                            size: 16,
                          ),
                          Gap(5),
                          Text(
                            '123 Main St, City, Country',
                            style: AppFontStyles.getSize12(
                              fontColor: AppColors.slateGrayColor,
                            ),
                          ),
                        ],
                      ),
                      Gap(5),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Gap(5),
                          Text(
                            '4.5 | 200 reviews',
                            style: AppFontStyles.getSize14(
                              fontColor: AppColors.slateGrayColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : AppColors.darkColor,
                      size: 24,
                    ),
                  ),
                ],
              ),
              if (widget.submitRequest) ...[
                Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MainButton(
                      buttonText: 'Submit Request',
                      onPressed: () {
                        pushTo(
                          context: context,
                          route: Routes.UnifiledpatientData,
                        );
                      },
                      borderColor: AppColors.primaryGreenColor,
                      borderRadius: 30,

                      height: 40,
                      textColor: AppColors.primaryGreenColor,
                      width: 200,
                      buttomColor: AppColors.whiteColor,
                      borderWidth: 2,
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
