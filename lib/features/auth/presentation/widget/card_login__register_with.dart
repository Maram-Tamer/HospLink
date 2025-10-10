import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class CardLogin_RegisterWith extends StatelessWidget {
  const CardLogin_RegisterWith({
    super.key,
    required this.widget,
    required this.title,
    required this.subtitle,
    required this.route,
  });
  final String title;
  final String subtitle;
  final String route;

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    endIndent: 15,
                    indent: 70,
                    color: AppColors.greyColor,
                  ),
                ),
                Center(
                  child: Text(
                    'Or login with',
                    style: AppFontStyles.getSize14(
                      fontColor: AppColors.greyColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    endIndent: 70,
                    indent: 15,
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
            Gap(10),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.whiteColor,

                  child: CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    radius: 15,
                    child: Image.asset(AppImages.facebook),
                  ),
                ),
                Gap(20),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.whiteColor,

                  child: CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    radius: 15,
                    child: Image.asset(AppImages.google),
                  ),
                ),
                Gap(20),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.whiteColor,

                  child: CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    radius: 15,
                    child: Image.asset(AppImages.apple),
                  ),
                ),
              ],
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: TextStyle(fontSize: 17)),
                GestureDetector(
                  onTap: () {
                    pushWithReplacment(context: context, route: route);
                  },
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      color: AppColors.primaryGreenColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
