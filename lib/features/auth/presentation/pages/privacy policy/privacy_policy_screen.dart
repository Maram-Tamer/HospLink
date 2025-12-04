import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  // Reusable bullet point row
  Widget _bulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: AppColors.primaryBlueColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            text,
            style: AppFontStyles.getSize14(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        leading: true,
        title: 'Privacy',
      ),
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
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(15),
              Text(
                'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words believable. It is a long established fact that reader will be distracted by the readable content of a page when looking at its layout.',
                style: AppFontStyles.getSize14(fontWeight: FontWeight.w500),
              ),
              const Gap(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    _bulletPoint(
                        'The standard chunk of Lorem Ipsum used since 1500s is reproduced below for those interested.'),
                    const Gap(10),
                    _bulletPoint(
                        'Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum. The point of using.'),
                    const Gap(10),
                    _bulletPoint(
                        'Lorem Ipsum is that it has a moreIt is a long established fact that reader will be distracted.'),
                    const Gap(10),
                    _bulletPoint(
                        'The point of using Lorem Ipsum is that it has a moreIt is a long established fact that reader will be distracted.'),
                  ],
                ),
              ),
              const Gap(15),
              Text(
                'It is a long established fact that reader distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a moreIt is a long established.',
                style: AppFontStyles.getSize14(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
