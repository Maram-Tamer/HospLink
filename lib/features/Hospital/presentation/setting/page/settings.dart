import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/setting%20items/settings_group.dart';
import 'package:medigo/components/setting%20items/settings_items.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class SettingsHospitalScreen extends StatelessWidget {
  const SettingsHospitalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(title: "Settings"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Gap(20),
            Text(
              "Account",
              style: AppFontStyles.getSize18(
                fontColor: AppColors.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(10),
            SettingsGroup(
              items: [
                SettingsItem(
                  icon: Icons.person,
                  iconColor: Colors.green,
                  title: "Edit Profile",
                  onPressed: () =>
                      pushTo(context: context, route: Routes.EditProfile),
                ),
                SettingsItem(
                  icon: Icons.history_rounded,
                  iconColor: Colors.red,
                  title: "Patients History",
                  onPressed: () =>
                      pushTo(context: context, route: Routes.PatientHistory),
                ),
                SettingsItem(
                  icon: Icons.lock,
                  iconColor: Colors.blue,
                  title: "Change Password",
                  onPressed: () =>
                      pushTo(context: context, route: Routes.ChangePassword),
                ),
              ],
            ),
            const Gap(25),
            Text(
              "General",
              style: AppFontStyles.getSize18(
                fontColor: AppColors.darkGreyColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(10),
            SettingsGroup(
              items: [
                SettingsItem(
                  icon: Icons.notifications,
                  iconColor: Colors.amber,
                  title: "Notifications",
                  hasSwitch: true,
                  initialValue: true,
                  onSwitchChanged: (v) => log("Notifications: $v"),
                ),
                SettingsItem(
                  icon: Icons.dark_mode,
                  iconColor: Colors.deepPurple,
                  title: "Dark Theme",
                  hasSwitch: true,
                  onSwitchChanged: (v) => log("Dark Theme: $v"),
                ),
                SettingsItem(
                  icon: Icons.share,
                  iconColor: Colors.indigo,
                  title: "Share App",
                  onPressed: () => log("Share App tapped"),
                ),
                SettingsItem(
                  icon: Icons.star,
                  iconColor: Colors.orange,
                  title: "Rate App",
                  onPressed: () => log("Rate App tapped"),
                ),
                SettingsItem(
                  icon: Icons.feedback_outlined,
                  iconColor: Colors.deepPurple,
                  title: "Sent FeadBack",
                  onPressed: () => log("Send Feedback tapped"),
                ),
                SettingsItem(
                  icon: Icons.info_outline,
                  iconColor: Colors.lightBlueAccent,
                  title: "About Us",
                  onPressed: () => log("Send Feedback tapped"),
                ),
                SettingsItem(
                  icon: Icons.logout,
                  iconColor: AppColors.red,
                  title: "Logout",
                  onPressed: () => pushAndRemoveUntil(
                    context: context,
                    route: Routes.welcom,
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
