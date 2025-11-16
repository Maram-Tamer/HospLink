import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Hospital/data/model/doctor-model.dart';

class HospitalCard extends StatefulWidget {
  const HospitalCard({
    super.key,
    this.submitRequest = false,
    required this.hospital,
  });

  final bool submitRequest;
  final HospitalModel hospital;

  @override
  State<HospitalCard> createState() => _HospitalCardState();
}

class _HospitalCardState extends State<HospitalCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(
          context: context,
          route: Routes.HospitalDetails,
          extra: {'hospital': widget.hospital, 'isAccepted': false},
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 30),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// IMAGE FIX — prevents crash when URL is empty
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        widget.hospital.imageUri?.isNotEmpty == true
                            ? widget.hospital.imageUri!
                            : "https://via.placeholder.com/70", // fallback image
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                        errorBuilder: (c, e, s) => Image.asset(
                          "assets/images/default_hospital.png",
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Gap(15),

                  /// TEXT AREA (Expanded fixes overflow)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Hospital Name
                        Text(
                          widget.hospital.name ?? 'Unknown Hospital',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppFontStyles.getSize16(
                            fontColor: AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(5),

                        /// Address
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.primaryGreenColor,
                              size: 16,
                            ),
                            Gap(5),
                            Expanded(
                              child: Text(
                                widget.hospital.address ?? 'No address',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: AppFontStyles.getSize12(
                                  fontColor: AppColors.slateGrayColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(5),

                        /// Rating
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Gap(5),
                            Text(
                              '${widget.hospital.rate ?? "0.0"} ',
                              style: AppFontStyles.getSize14(
                                fontColor: AppColors.slateGrayColor,
                              ),
                            ),
                            Text(
                              '| 200 reviews',
                              style: AppFontStyles.getSize14(
                                fontColor: AppColors.slateGrayColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// Favorite Icon
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

              /// Submit Request Button (if needed)
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
