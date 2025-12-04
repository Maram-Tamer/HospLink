import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart' as date;
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Hospital/data/model/hospital-model.dart';
import 'package:medigo/features/Hospital/presentation/pages/patient_details/presentation/widgets/patient_details_list.dart';
import 'package:medigo/features/Patient/data/model/history_model.dart';
import 'package:medigo/features/Patient/data/model/request-model.dart';
import 'package:medigo/features/Patient/presentation/cubit/patient-cubit.dart';
import 'package:medigo/features/Patient/presentation/cubit/patient-state.dart';
import 'package:medigo/features/Patient/presentation/pages/hospital_data/presentation/widgets/hospital_detail_tile.dart';
import 'package:medigo/features/Patient/presentation/pages/hospital_data/presentation/widgets/photo_card.dart';
import 'package:medigo/features/Patient/presentation/pages/hospital_data/presentation/widgets/star_rating.dart';
import 'package:url_launcher/url_launcher.dart';

class Requestscreen extends StatefulWidget {
  Requestscreen({super.key, required this.data, this.accepted = false});

  final Map<String, dynamic>? data;
  final bool accepted;
  @override
  State<Requestscreen> createState() => _RequestscreenState();
}

class _RequestscreenState extends State<Requestscreen> {
  late HospitalModel? hospital = widget.data?['hospital'] as HospitalModel?;

  late RequestModel? request = widget.data?['request'] as RequestModel?;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !widget.accepted
          ? MainAppBar(
              title: " Details    ",
              leading: true,
            )
          : null,
      body: BlocBuilder<PatientCubit, PatientState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Hospital Header Image
                        PhotoCard(
                            image: hospital?.imageUri ?? '',
                            name: hospital?.name ?? ''),
                        const Gap(20),

                        Text(
                          hospital?.description ?? '',
                          style: AppFontStyles.getSize16(
                            fontColor: AppColors.darkGreyColor,
                          ),
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Gap(10),

                        // Rating and cases
                        Row(
                          children: [
                            Icon(Icons.star, color: AppColors.yellow),
                            Text(
                              hospital?.rate ?? '',
                              style: AppFontStyles.getSize16(
                                fontColor: AppColors.darkColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Gap(20),
                            SvgPicture.asset(
                              AppIcons.patientLoginSVG,
                              height: 25,
                              width: 25,
                              colorFilter: ColorFilter.mode(
                                AppColors.primaryBlueColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            Text(
                              hospital?.totalPatient ?? '',
                              style: AppFontStyles.getSize16(
                                fontColor: AppColors.darkColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),

                        const Gap(10),
                        const Divider(thickness: 1),

                        // Contact Info
                        HospitalDetailsTile(
                          text: hospital?.address ?? '',
                          icon: AppIcons.locationSVG,
                          color: AppColors.red,
                        ),
                        const Gap(10),
                        HospitalDetailsTile(
                          text: '24 Hour',
                          style: TextStyle(
                            color: AppColors.green,
                            fontWeight: FontWeight.w600,
                          ),
                          icon: AppIcons.clockSVG,
                        ),
                        const Gap(10),
                        HospitalDetailsTile(
                          onTap: () {
                            launchUrl(Uri.parse(hospital?.website ?? ''));
                          },
                          text: 'Click here to go the website',
                          icon: AppIcons.webSVG,
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        const Gap(10),
                        HospitalDetailsTile(
                          text: hospital?.phone ?? '',
                          icon: AppIcons.callFillSVG,
                          color: AppColors.green,
                        ),
                        const Gap(20),
                        Text(
                          'click here to go google maps ↧',
                          style: AppFontStyles.getSize14(
                            fontColor: AppColors.darkColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gap(5),

                        GestureDetector(
                          onTap: () {
                            launchUrl(Uri.parse(
                                'geo:${hospital?.locationLati},${hospital?.locationLong}?q=${hospital?.locationLati},${hospital?.locationLong}(${hospital?.name})&zoom=18,'));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              AppImages.map,
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Gap(20),
                      ],
                    ),
                  ),
                ),
                Text(
                  'Request Details',
                  style: AppFontStyles.getSize24(
                      fontWeight: FontWeight.w600,
                      fontColor: AppColors.primaryBlueColor),
                ),
                Gap(10),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.primaryBlueColor,
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: PatientDetailsList(
                    request: request!,
                  ),
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Row(
            children: [
              if (request!.state == 'Pending') ...[
                Expanded(
                  child: MainButton(
                    buttonText: "Cancel",
                    buttomColor: AppColors.red,
                    onPressed: () {
                      FirebaseServices.deleteRequest(request!.requestID ?? '');
                      pop(context);
                    },
                    icon: AppIcons.deleteSVG,
                  ),
                ),
              ],
              if (request!.state == 'Accepted') ...[
                Expanded(
                  child: MainButton(
                    buttonText: "Complete",
                    onPressed: () {
                      _showReviewBottomSheet(
                          context, context.read<PatientCubit>());
                    },
                    icon: AppIcons.send2SVG,
                  ),
                ),
                const Gap(15),
                GestureDetector(
                  onTap: () {
                    pushTo(context: context, route: Routes.chat);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlueColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      AppIcons.chat2SVG,
                      height: 35,
                      colorFilter: ColorFilter.mode(
                        AppColors.whiteColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _showReviewBottomSheet(BuildContext context, PatientCubit cubit) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => Directionality(
            textDirection:
                TextDirection.ltr, // or rtl if you want Arabic layout
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 20,
                right: 20,
                top: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      Text(
                        'Add Review',
                        style: AppFontStyles.getSize24(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.close_rounded),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  const Gap(10),

                  Text(
                    "Share your experience",
                    style: AppFontStyles.getSize16(
                      fontColor: AppColors.darkGreyColor,
                    ),
                  ),
                  const Gap(10),

                  // Comment field
                  TextFormField(
                    controller: cubit.commentController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Write your review here...",
                      hintStyle: AppFontStyles.getSize14(
                        fontColor: Colors.grey,
                      ),
                      filled: true,
                      fillColor: const Color(0xfff5f5f5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StarRating(
                        rating: cubit.currentRating,
                        onRatingChanged: (newRating) {
                          setState(() {
                            cubit.currentRating = newRating;
                          });
                        },
                      ),
                    ],
                  ),
                  const Gap(20),

                  // Submit button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: MainButton(
                      buttonText: 'Submit Review',
                      onPressed: () {
                        final history = HistoryModel(
                          addressHospital: hospital?.address,
                          hospitalId: hospital?.uid,
                          namePatient: request?.name,
                          patientId: request?.patientID,
                          phonePatient: request?.phone,
                          profileHospital: hospital?.imageUri,
                          profilePatient: request?.imageProfilePath,
                          rateFromPatient: cubit.currentRating.toString(),
                          message: cubit.commentController.text,
                          date: date.DateFormat('yyyy-MM-dd')
                              .format(DateTime.now())
                              .toString(),
                          historyId: FirebaseFirestore.instance
                              .collection('history')
                              .doc()
                              .id,
                        );
                        FirebaseServices.createHistory(history);
                        FirebaseServices.deleteRequest(
                            request!.requestID ?? '');

                        var totalPatient = hospital?.totalPatient;
                        var rate = hospital?.rate;
                        int x = int.parse(totalPatient ?? "1") *
                            int.parse(rate ?? '1');
                        x += cubit.currentRating;
                        double y = x / (int.parse(totalPatient ?? '1') + 1);
                        FirebaseServices.updateHospitalRate(hospital?.uid ?? '',
                            y, int.parse(totalPatient ?? '1') + 1);

                        Navigator.pop(context);
                      },
                      icon: AppIcons.send2SVG,
                    ),
                  ),
                  Gap(20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
