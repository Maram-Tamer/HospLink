import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/setting_items/settings_group.dart';
import 'package:medigo/components/setting_items/settings_items.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/services/local/local-helper.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class SettingsHospitalScreen extends StatelessWidget {
  const SettingsHospitalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColor = brightness == Brightness.dark ? Colors.white : Colors.black;

    final size = MediaQuery.of(context).size;
    double responsiveFont(double value) => value * size.width / 390;

    return Scaffold(
      appBar: MainAppBar(title: "Settings"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Gap(20),
            Text(
              "Account",
              style: AppFontStyles.getSize18(
                fontSize: responsiveFont(20),
                fontWeight: FontWeight.w500,
              ).copyWith(color: textColor),
            ),
            const Gap(10),
            SettingsGroup(
              items: [
                SettingsItem(
                  icon: Icons.person,
                  iconColor: Colors.green,
                  title: "Edit Profile",
                  onPressed: () =>
                      pushTo(context: context, route: Routes.editProfile_H),
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
                      pushTo(context: context, route: Routes.editPassword_H),
                ),
              ],
            ),
            const Gap(25),
            Text(
              "General",
              style: AppFontStyles.getSize18(
                fontSize: responsiveFont(20),
                fontWeight: FontWeight.w500,
              ).copyWith(color: textColor),
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
                  title: "Send Feedback",
                  onPressed: () => log("Send Feedback tapped"),
                ),
                SettingsItem(
                  icon: Icons.info_outline,
                  iconColor: Colors.lightBlueAccent,
                  title: "About Us",
                  onPressed: () => log("About Us tapped"),
                ),
                SettingsItem(
                  icon: Icons.logout,
                  iconColor: AppColors.red,
                  title: "Logout",
                  onPressed: () {
                    pushAndRemoveUntil(
                      context: context,
                      route: Routes.welcom,
                    );
                    LocalHelper.remove(LocalHelper.kUserId);
                    LocalHelper.remove(LocalHelper.kUserType);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
