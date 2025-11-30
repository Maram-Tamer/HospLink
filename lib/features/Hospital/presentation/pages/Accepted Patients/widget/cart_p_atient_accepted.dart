import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Hospital/presentation/pages/Accepted%20Patients/widget/item_patient_accepted.dart';
import 'package:medigo/features/Patient/data/model/request-model.dart';

class cartPAtientAccepted extends StatelessWidget {
  const cartPAtientAccepted({super.key, required this.request});
  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          pushTo(
              context: context,
              route: Routes.PatientDetails,
              extra: {'request': request, 'isAccepted': true});
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(50),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 43,
                      backgroundColor: AppColors.blueLight,
                      backgroundImage: NetworkImage(
                          request.imageProfilePath ?? AppImages.PatientPhoto3),
                    ),
                    Gap(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Text(
                              request.name ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: AppFontStyles.getSize18(
                                fontWeight: FontWeight.w600,
                                fontColor: AppColors.blackColor,
                              ),
                            ),
                          ),
                          Gap(10),
                          Text(
                            '${request.age} years old ',
                            style: AppFontStyles.getSize14(
                              fontWeight: FontWeight.w400,
                              fontColor: AppColors.greyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Gap(20),
                  ],
                ),
              ),
              itemPatientAccepted(
                maxLine: 2,
                title: request.address ?? '',
                icon: AppIcons.locationLine_SVG,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 5,
                children: [
                  itemPatientAccepted(
                      title: request.blood ?? '', icon: AppIcons.booldSVG),
                  itemPatientAccepted(
                    title: request.nationalID ?? '',
                    icon: AppIcons.ID_SVG,
                  ),
                  itemPatientAccepted(
                    title: request.phone ?? '',
                    icon: AppIcons.callSVG,
                  ),
                ],
              ),
              Gap(10),
              Divider(
                color: AppColors.greyColor,
                indent: 20,
                endIndent: 20,
                thickness: .5,
              ),
              Gap(10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  request.description ?? '',
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: AppFontStyles.getSize14(
                    fontColor: AppColors.greyColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
