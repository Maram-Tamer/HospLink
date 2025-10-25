import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Patient/hospital_data/presentation/widgets/hospital_detail_tile.dart';
import 'package:medigo/features/Patient/hospital_data/presentation/widgets/star_rating.dart';
import 'package:medigo/features/patient/hospital_data/presentation/widgets/photo_card.dart';

class HospitalDetailsScreen extends StatefulWidget {
  HospitalDetailsScreen({super.key, required this.isAccepted});
  final bool isAccepted;

  @override
  State<HospitalDetailsScreen> createState() => _HospitalDetailsScreenState();
}

class _HospitalDetailsScreenState extends State<HospitalDetailsScreen> {
  final List<int> ratings = List.filled(3, 0);
  int currentRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Row(
            children: [
              if (widget.isAccepted) ...[
                Expanded(
                  child: MainButton(
                    buttonText: "Complete",
                    onPressed: () => _showReviewBottomSheet(context),
                    icon: AppIcons.completeSVG,
                  ),
                ),
              ] else ...[
                Expanded(
                  child: MainButton(
                    buttonText: "Send Request",
                    onPressed: () {
                      if (widget.isAccepted) {
                        _showReviewBottomSheet(context);
                      } else {
                        pushTo(
                          context: context,
                          route: Routes.UnifiledpatientData,
                        );
                      }
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
                      color: AppColors.primaryGreenColor,
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
      appBar: App_Bar(
        title: "Hospital Details",
        leading: widget.isAccepted ? false : true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Hospital Header Image
              PhotoCard(image: AppImages.hospitalPhoto1, name: 'Hospital Name'),
              const Gap(20),

              Text(
                "Saudi German Hospital- Cairo, part of the Middle East's leading healthcare group, is a landmark tertiary care hospital in Africa. Offering world-class services across specialties, it sets the gold standard for patient-centered care in Egypt and beyond. Established in 2016 as the first African outpost of the renowned Saudi German Hospitals Group, SGH-Cairo has quickly become a major tertiary care hospital in Egypt. By embracing state-of-the-art technology and a patient-centric approach, it has earned the trust of both local and international patients, setting a new standard for healthcare in the region.",
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
                    "4.8",
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
                      AppColors.primaryGreenColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    "+1200 cases",
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
                text: "20 El Marghani St, Cairo",
                icon: AppIcons.locationSVG,
                color: AppColors.red,
              ),
              const Gap(10),
              HospitalDetailsTile(
                text: "Opens 24 Hours",
                icon: AppIcons.clockSVG,
              ),
              const Gap(10),
              HospitalDetailsTile(
                text: "www.saudigerman.com",
                icon: AppIcons.webSVG,
              ),
              const Gap(10),
              HospitalDetailsTile(
                text: "+20 105645454",
                icon: AppIcons.callFillSVG,
                color: AppColors.green,
              ),
              const Gap(20),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  AppImages.map,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }

  void _showReviewBottomSheet(BuildContext context) {
    final TextEditingController commentController = TextEditingController();

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
                    controller: commentController,
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
                        rating: currentRating,
                        onRatingChanged: (newRating) {
                          setState(() {
                            currentRating = newRating;
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
