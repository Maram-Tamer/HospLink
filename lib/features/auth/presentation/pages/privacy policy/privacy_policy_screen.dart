import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/ScrrenBackgroung/background.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        appBar: App_Bar(leading: true,title: 'Privacy',),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Doctor Hunt Apps Privacy Policy',
                  style: AppFontStyles.getSize18(
                    fontColor: AppColors.slateGrayColor,
                    fontWeight: FontWeight.w600
                  ),
                ),
                Gap(15),
                Text(
                  'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words believable. It is a long established fact that reader will distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a moreIt is a long established fact that reader will distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more ',
                  style: AppFontStyles.getSize14(fontWeight: FontWeight.w500),
                ),
                Gap(15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryGreenColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 8,
                            height: 8,
                          ),
                          Gap(15),
                          Expanded(
                            child: Text(
                              'The standard chunk of lorem Ipsum used since  1500s is reproduced below for those interested. ',
                              style: AppFontStyles.getSize14(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Gap(10),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryGreenColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 8,
                            height: 8,
                          ),
                          Gap(15),
                          Expanded(
                            child: Text(
                              'Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum. The point of using.',
                              style: AppFontStyles.getSize14(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),          
                      Gap(10),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryGreenColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 8,
                            height: 8,
                          ),
                          Gap(15),
                          Expanded(
                            child: Text(
                              ' Lorem Ipsum is that it has a moreIt is a long established fact that reader will distracted.',
                              style: AppFontStyles.getSize14(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Gap(10),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryGreenColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 8,
                            height: 8,
                          ),
                          Gap(15),
                          Expanded(
                            child: Text(
                              'The point of using Lorem Ipsum is that it has a moreIt is a long established fact that reader will distracted.',
                              style: AppFontStyles.getSize14(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(15),
                 Text(
                  'It is a long established fact that reader distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a moreIt is a long established.',
                  style: AppFontStyles.getSize14(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
