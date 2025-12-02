import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/core/services/local/local-helper.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Hospital/data/model/hospital-model.dart';
import 'package:medigo/features/Patient/data/model/patient-model.dart';
import 'package:medigo/features/Patient/data/model/request-model.dart';
import 'package:medigo/features/Patient/data/repo/patient-repo.dart';

class HospitalCard extends StatefulWidget {
  const HospitalCard(
      {super.key,
      this.submitRequest = false,
      required this.hospital,
      this.km,
      this.request});
  final double? km;
  final bool submitRequest;
  final HospitalModel hospital;
  final RequestModel? request;
  @override
  State<HospitalCard> createState() => _HospitalCardState();
}

class _HospitalCardState extends State<HospitalCard> {
  PatientModel patient = LocalHelper.getUserDataPatient()!;

  late bool isFavorite =
      patient.favoriteHospitals?.contains(widget.hospital.uid) ?? false;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: (widget.request?.state == 'Rejected')
          ? DismissDirection.endToStart
          : DismissDirection.none,
      background: SizedBox(),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          FirebaseServices.deleteRequest(widget.request?.requestID ?? '');
        }
      },
      secondaryBackground: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.delete_outline_outlined, color: AppColors.whiteColor),
            Gap(8),
            Text(
              'Delete !',
              style: AppFontStyles.getSize14(
                fontColor: AppColors.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      child: GestureDetector(
        onTap: () {
          if (widget.request != null) {
            pushTo(
              context: context,
              route: Routes.Request_screen,
              extra: {
                'hospital': widget.hospital,
                'request': widget.request,
              },
            );
          } else {
            pushTo(
              context: context,
              route: Routes.HospitalDetails,
              extra: {
                'hospital': widget.hospital,
                'isAccepted': false,
                'km': widget.km,
              },
            );
          }
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
            padding:
                const EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 10),
            child: Column(
              children: [
                Gap(5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                              SizedBox(
                                width: 25,
                                child: Text(
                                  '${widget.hospital.rate ?? "0.0"} ',
                                  style: AppFontStyles.getSize14(
                                    fontColor: AppColors.slateGrayColor,
                                  ),
                                ),
                              ),
                              Gap(10),
                              if (widget.km != null) ...[
                                Icon(Icons.location_on_sharp,
                                    color: Colors.red, size: 16),
                                Text(
                                  ' ${widget.km!.toStringAsFixed(2)} Km ',
                                  style: AppFontStyles.getSize14(
                                    fontColor: AppColors.slateGrayColor,
                                  ),
                                ),
                              ],
                              if (widget.km == null) ...[
                                Row(
                                  children: [
                                    Icon(Icons.person_add_rounded,
                                        color: AppColors.primaryGreenColor,
                                        size: 16),
                                    Text(
                                      ' +${widget.hospital.totalPatient} Patient',
                                      style: AppFontStyles.getSize14(
                                        fontColor: AppColors.slateGrayColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),

                    /// Favorite Icon
                    if (widget.request != null) ...[
                      SizedBox(
                        width: 85,
                        height: 25,
                        child: Container(
                          decoration: BoxDecoration(
                              color: (widget.request?.state == 'Accepted')
                                  ? AppColors.greenLight
                                  : (widget.request?.state == 'Rejected')
                                      ? AppColors.redLight
                                      : AppColors.blueight2,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              widget.request?.state ?? 'll',
                              style: AppFontStyles.getSize16(
                                fontWeight: FontWeight.w500,
                                fontColor: (widget.request?.state == 'Accepted')
                                    ? AppColors.blue2
                                    : (widget.request?.state == 'Rejected')
                                        ? AppColors.red
                                        : AppColors.primaryGreenColor,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                    if (widget.request == null) ...[
                      IconButton(
                        onPressed: () async {
                          PatientModel patient =
                              await PatientRepo.getPatientDetails();
                          if (isFavorite) {
                            patient.favoriteHospitals!
                                .remove(widget.hospital.uid!);
                          } else {
                            patient.favoriteHospitals!
                                .add(widget.hospital.uid!);
                          }
                          FirebaseServices.updatePatient(patient);
                          LocalHelper.setUserDataPatient(patient);
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
                    ]
                  ],
                ),
                Gap(5),

                /// Submit Request Button (if needed)
                if (widget.submitRequest) ...[
                  Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }
}
