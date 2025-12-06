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

// ignore: must_be_immutable
class Requestscreen extends StatefulWidget {
  Requestscreen({super.key, required this.data, this.accepted = false});

  final Map<String, dynamic>? data;
  final bool accepted;

  int curruntIndex = 0;
  @override
  State<Requestscreen> createState() => _RequestscreenState();
}

class _RequestscreenState extends State<Requestscreen> {
  late HospitalModel? hospital = widget.data?['hospital'] as HospitalModel?;
  late RequestModel? request = widget.data?['request'] as RequestModel?;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      // ---------------- APPBAR ----------------
      appBar: !widget.accepted
          ? MainAppBar(
              
              title: " Details    ",
              leading: true,
            )
          : null,

      // ---------------- BODY ----------------
      body: BlocBuilder<PatientCubit, PatientState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PhotoCard(
                        image: hospital?.imageUri ?? '',
                        name: hospital?.name ?? '',
                      ),

                      Gap(20),

                      Text(
                        hospital?.description ?? '',
                        style: AppFontStyles.getSize16(
                          fontColor: theme.colorScheme.onSurface,
                        ),
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                      ),

                      Gap(10),

                      // ------- RATING ROW -------
                      Row(
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            color: AppColors.yellow,
                          ),
                          Text(
                            hospital?.rate ?? '',
                            style: AppFontStyles.getSize16(
                              fontColor: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(20),
                          SvgPicture.asset(
                            AppIcons.patientLoginSVG,
                            height: 25,
                            width: 25,
                            colorFilter: ColorFilter.mode(
                              theme.colorScheme.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                          Text(
                            hospital?.totalPatient ?? '',
                            style: AppFontStyles.getSize16(
                              fontColor: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      Gap(10),
                      Divider(color: theme.dividerColor),

                      HospitalDetailsTile(
                        text: hospital?.address ?? '',
                        icon: AppIcons.locationSVG,
                        color: theme.colorScheme.error,
                      ),

                      Gap(10),

                      HospitalDetailsTile(
                        text: '24 Hour',
                        icon: AppIcons.clockSVG,
                        style: TextStyle(
                          color: AppColors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Gap(10),

                      HospitalDetailsTile(
                        onTap: () =>
                            launchUrl(Uri.parse(hospital?.website ?? '')),
                        text: 'Click here to go the website',
                        icon: AppIcons.webSVG,
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),

                      Gap(10),

                      HospitalDetailsTile(
                        text: hospital?.phone ?? '',
                        icon: AppIcons.callFillSVG,
                        color: AppColors.green,
                      ),

                      Gap(20),

                      Text(
                        'click here to go google maps ↧',
                        style: AppFontStyles.getSize14(
                          fontColor: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Gap(5),

                      GestureDetector(
                        onTap: () {
                          launchUrl(Uri.parse(
                              'geo:${hospital?.locationLati},${hospital?.locationLong}?q=${hospital?.locationLati},${hospital?.locationLong}(${hospital?.name})&zoom=18'));
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
                Text(
                  'Request Details',
                  style: AppFontStyles.getSize24(
                    fontWeight: FontWeight.w600,
                    fontColor: theme.colorScheme.primary,
                  ),
                ),
                Gap(10),
                Divider(color: theme.colorScheme.primary),
                Gap(10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: PatientDetailsList(request: request!),
                )
              ],
            ),
          );
        },
      ),

      // ---------------- BOTTOM BAR ----------------
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Row(
            children: [
              // -------- Pending Request -> Cancel --------
              if (request!.state == 'Pending')
                Expanded(
                  child: MainButton(
                    buttonText: "Cancel",
                    buttomColor: theme.colorScheme.error,
                    onPressed: () {
                      FirebaseServices.deleteRequest(request!.requestID ?? '');
                      pop(context);
                    },
                    icon: AppIcons.deleteSVG,
                  ),
                ),

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
                Gap(15),
                GestureDetector(
                  onTap: () => pushTo(context: context, route: Routes.chat),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      AppIcons.chat2SVG,
                      height: 35,
                      colorFilter: ColorFilter.mode(
                        theme.colorScheme.onPrimary,
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

  // ------------------------------ BOTTOM SHEET ------------------------------

  void _showReviewBottomSheet(BuildContext context, PatientCubit cubit) {
  final theme = Theme.of(context);

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: theme.cardColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 10,
          right: 10,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Add Review',
                  style: AppFontStyles.getSize24(
                    fontWeight: FontWeight.w600,
                    fontColor: theme.colorScheme.onSurface,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.close_rounded,
                      color: theme.iconTheme.color),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),

            Gap(10),

            Text(
              "Share your experience",
              style: AppFontStyles.getSize16(
                fontColor: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),

            Gap(10),

            TextFormField(
              controller: cubit.commentController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Write your review here...",
                filled: true,
                fillColor: theme.inputDecorationTheme.fillColor ??
                    theme.cardColor.withOpacity(0.1),
                hintStyle: TextStyle(color: theme.hintColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            Gap(20),

            // ⭐⭐⭐⭐⭐ STAR RATING WITH WORKING UPDATE
            StatefulBuilder(
              builder: (context, setModalState) {
                return Center(
                  child: StarRating(
                    rating: widget.curruntIndex,
                    onRatingChanged: (newRating) {
                      setModalState(() {
                        widget.curruntIndex = newRating;
                        cubit.currentRating = newRating;
                      });
                    },
                  ),
                );
              },
            ),

            Gap(20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: MainButton(
                buttonText: 'Submit Review',
                onPressed: () {
                  pop(context);
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
                  FirebaseServices.deleteRequest(request!.requestID ?? '');

                  int total = int.parse(hospital?.totalPatient ?? "1");
                  int oldRate = int.parse(hospital?.rate ?? '1');

                  int totalScore = oldRate * total + cubit.currentRating;
                  double newRate = totalScore / (total + 1);

                  FirebaseServices.updateHospitalRate(
                    hospital?.uid ?? '',
                    newRate,
                    total + 1,
                  );

                 
                },
                icon: AppIcons.send2SVG,
              ),
            ),

            Gap(20),
          ],
        ),
      );
    },
  );
}

}
