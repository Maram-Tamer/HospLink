import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Patient/widgets/settings_group.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Patient/widgets/settings_items.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              "Account",
              style: AppFontStyles.getSize18(
                fontColor: AppColors.darkGreyColor,
                fontSize: 20,
              ),
            ),
            const Gap(10),
            SettingsGroup(
              items: [
                SettingsItem(
                  icon: Icons.person,
                  iconColor: Colors.green,
                  title: "Edit Profile",
                  onPressed: () => log("Edit Profile tapped"),
                ),
                SettingsItem(
                  icon: Icons.medical_information,
                  iconColor: Colors.red,
                  title: "Medical History",
                  onPressed: () => log("Medical History tapped"),
                ),
                SettingsItem(
                  icon: Icons.lock,
                  iconColor: Colors.blue,
                  title: "Change Password",
                  onPressed: () => log("Change Password tapped"),
                ),
              ],
            ),
            const Gap(25),
            Text(
              "General",
              style: AppFontStyles.getSize18(
                fontColor: AppColors.darkGreyColor,
                fontSize: 20,
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
              ],
            ),
            //  Gap(10),

            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 10),
            //   child: MainButton(
            //     buttonText: "Logout",
            //     onPressed: () => log("Logout tapped"),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
