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
  const HospitalCard({
    super.key,
    this.submitRequest = false,
    required this.hospital,
    this.km,
    this.request,
  });

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

  Color _getStatusBackgroundColor(String state, ColorScheme colorScheme) {
    if (state == 'Accepted') {
      return Colors.green;
    } else if (state == 'Rejected') {
      return colorScheme.error;
    }
    return colorScheme.primary;
  }

  Color _getStatusTextColor(String state, ColorScheme colorScheme) {
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    /// Updated Text Colors (responsive)
    final primaryTextColor = isDark ? Colors.white : Colors.black87;
    final secondaryTextColor = isDark ? Colors.white70 : Colors.black54;

    final favoriteIconColor = AppColors.red;
    final starIconColor = Colors.yellow;

    return Dismissible(
      key: UniqueKey(),
      direction: (widget.request?.state == 'Rejected')
          ? DismissDirection.endToStart
          : DismissDirection.none,
      background: const SizedBox(),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          FirebaseServices.deleteRequest(widget.request?.requestID ?? '');
        }
      },
      secondaryBackground: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colorScheme.error,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.delete_outline_outlined, color: colorScheme.onError),
            const Gap(8),
            Text(
              'Delete !',
              style: AppFontStyles.getSize14(
                fontColor: colorScheme.onError,
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
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withOpacity(0.4)
                    : Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 10),
            child: Column(
              children: [
                const Gap(5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// IMAGE
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          widget.hospital.imageUri?.isNotEmpty == true
                              ? widget.hospital.imageUri!
                              : "https://via.placeholder.com/70",
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

                    const Gap(15),

                    /// TEXT AREA
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
                              fontColor: primaryTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(5),

                          /// Address
                          Row(
                            children: [
                              const Gap(5),
                              Expanded(
                                child: Text(
                                  widget.hospital.address ?? 'No address',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: AppFontStyles.getSize12(
                                    fontColor: secondaryTextColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(5),

                          /// Rating & Distance
                          Row(
                            children: [
                              Icon(Icons.star, color: starIconColor, size: 16),
                              const Gap(5),
                              SizedBox(
                                width: 25,
                                child: Text(
                                  '${widget.hospital.rate ?? "0.0"} ',
                                  style: AppFontStyles.getSize14(
                                    fontColor: secondaryTextColor,
                                  ),
                                ),
                              ),
                              const Gap(10),
                              if (widget.km != null) ...[
                                Icon(Icons.location_on_sharp,
                                    color: colorScheme.error, size: 16),
                                Text(
                                  ' ${widget.km!.toStringAsFixed(2)} Km ',
                                  style: AppFontStyles.getSize14(
                                    fontColor: secondaryTextColor,
                                  ),
                                ),
                              ],
                              if (widget.km == null) ...[
                                Row(
                                  children: [
                                    Icon(Icons.person_add_rounded,
                                        color: colorScheme.primary, size: 16),
                                    Text(
                                      ' +${widget.hospital.totalPatient} Patient',
                                      style: AppFontStyles.getSize14(
                                        fontColor: secondaryTextColor,
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

                    /// Request State / Favorite Icon
                    if (widget.request != null) ...[
                      SizedBox(
                        width: 85,
                        height: 25,
                        child: Container(
                          decoration: BoxDecoration(
                            color: _getStatusBackgroundColor(
                                widget.request!.state.toString(), colorScheme),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              widget.request?.state ?? 'N/A',
                              style: AppFontStyles.getSize16(
                                fontWeight: FontWeight.w500,
                                fontColor: Colors.white,
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
                          color:
                              isFavorite ? favoriteIconColor : primaryTextColor,
                          size: 24,
                        ),
                      ),
                    ]
                  ],
                ),
                const Gap(5),

                /// SUBMIT REQUEST BUTTON COLORS UPDATED ONLY
                if (widget.submitRequest) ...[
                  const Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainButton(
                        buttonText: 'Submit Request',
                        onPressed: () {
                          pushTo(
                              context: context,
                              route: Routes.UnifiledpatientData,
                              extra: widget.hospital.uid);
                        },

                        /// ⬇️ COLOR FIX
                        /// Dark mode → Blue background + white text
                        /// Light mode → Default existing colors
                        buttomColor:
                            isDark ? colorScheme.primary : colorScheme.surface,
                        textColor: isDark ? Colors.white : colorScheme.primary,

                        borderColor: colorScheme.primary,
                        borderRadius: 30,
                        height: 40,
                        width: 200,
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
//d
