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
import 'package:medigo/features/Hospital/data/model/hospital-model.dart';
import 'package:medigo/features/Patient/presentation/pages/hospital_data/presentation/widgets/hospital_detail_tile.dart';
import 'package:medigo/features/Patient/presentation/pages/hospital_data/presentation/widgets/photo_card.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalDetailsScreen extends StatefulWidget {
  const HospitalDetailsScreen({super.key, this.data});
  final Map<String, dynamic>? data;

  @override
  State<HospitalDetailsScreen> createState() => _HospitalDetailsScreenState();
}

class _HospitalDetailsScreenState extends State<HospitalDetailsScreen> {
  final List<int> ratings = List.filled(3, 0);
  late bool isAccepted = widget.data!['isAccepted'] as bool;
  late HospitalModel? hospital = widget.data?['hospital'] as HospitalModel?;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : AppColors.darkColor;
    final secondaryTextColor = isDark ? Colors.white70 : AppColors.darkGreyColor;
    final dividerColor = isDark ? Colors.white24 : Colors.grey.shade300;

    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Row(
            children: [
              if (isAccepted) ...[
                Expanded(
                  child: MainButton(
                    buttonText: "Complete",
                    onPressed: () {},
                    icon: AppIcons.completeSVG,
                  ),
                ),
              ] else ...[
                Expanded(
                  child: MainButton(
                    buttonText: "Send Request",
                    onPressed: () {
                      if (!isAccepted) {
                        pushTo(
                            context: context,
                            route: Routes.UnifiledpatientData,
                            extra: hospital?.uid);
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
      appBar: MainAppBar(
        title: "Hospital Details",
        leading: isAccepted ? false : true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Hospital Header Image
              PhotoCard(
                  image: hospital?.imageUri ?? '', name: hospital?.name ?? ''),
              const Gap(20),

              // Hospital Description
              Text(
                hospital?.description ?? '',
                style: AppFontStyles.getSize16(
                  fontColor: secondaryTextColor,
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
                      fontColor: textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(20),
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
                    "+1200 cases",
                    style: AppFontStyles.getSize16(
                      fontColor: textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Divider(thickness: 1, color: dividerColor),

              // Contact Info
              HospitalDetailsTile(
                text: hospital?.address ?? '',
                icon: AppIcons.locationSVG,
                color: AppColors.red,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(10),

              if (widget.data!['km'] != null) ...[
                HospitalDetailsTile(
                  text: '${widget.data!['km'].toStringAsFixed(2)} Km',
                  icon: AppIcons.locationLine_SVG,
                  color: AppColors.primaryBlueColor,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(10),
              ],

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
                text: 'Click here to go to the website',
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
                'Click here to go to Google Maps ↧',
                style: AppFontStyles.getSize14(
                  fontColor: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap(5),

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
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
