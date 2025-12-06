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
import 'package:medigo/main.dart'; // needed for theme toggle

class SettingsHospitalScreen extends StatefulWidget {
  const SettingsHospitalScreen({super.key});

  @override
  State<SettingsHospitalScreen> createState() => _SettingsHospitalScreenState();
}

class _SettingsHospitalScreenState extends State<SettingsHospitalScreen> {
  bool isDarkThemeOn = false;

  @override
  void initState() {
    super.initState();
    // Load saved theme preference
    isDarkThemeOn = LocalHelper.getData(LocalHelper.kDarkTheme) ?? false;
  }

  void _toggleDarkTheme(bool value) {
    setState(() {
      isDarkThemeOn = value;
    });

    LocalHelper.setData(LocalHelper.kDarkTheme, value);
    log("Dark Theme: $value");

    // Apply theme to whole app
    MainApp.of(context)?.toggleTheme(value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.titleLarge?.color ?? AppColors.blackColor;

    return Scaffold(
      appBar: MainAppBar(
        title: "Settings",
        color: theme.colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Gap(10),
            Text(
              "Account",
              style: AppFontStyles.getSize18(
                fontColor: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(10),

            // ACCOUNT GROUP
            SettingsGroup(
              items: [
                SettingsItem(
                  icon: Icons.person,
                  iconColor: Colors.green,
                  title: "Edit Profile",
                  onPressed: () =>
                      pushTo(context: context, route: Routes.editProfile_H),
                ),
                // SettingsItem(
                //   icon: Icons.history_rounded,
                //   iconColor: Colors.red,
                //   title: "Patients History",
                //   onPressed: () =>
                //       pushTo(context: context, route: Routes.PatientHistory),
                // ),
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
                fontColor: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(10),

            // GENERAL GROUP
            SettingsGroup(
              items: [
                SettingsItem(
                  icon: Icons.dark_mode,
                  iconColor: Colors.deepPurple,
                  title: "Dark Theme",
                  hasSwitch: true,
                  initialValue: isDarkThemeOn,
                  onSwitchChanged: _toggleDarkTheme,
                ),
                SettingsItem(
                  icon: Icons.notifications,
                  iconColor: Colors.amber,
                  title: "Notifications",
                  hasSwitch: true,
                  initialValue: true,
                  onSwitchChanged: (v) => log("Notifications: $v"),
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
                  onPressed: () =>
                      pushTo(context: context, route: Routes.aboutUs),
                ),
                SettingsItem(
                  icon: Icons.logout,
                  iconColor: Colors.red,
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
