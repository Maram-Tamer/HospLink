import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/features/Hospital/presentation/pages/Accepted%20Patients/page/accepted_Patients.dart';
import 'package:medigo/features/Hospital/presentation/pages/home/pages/hospital_home_screen.dart';
import 'package:medigo/features/Hospital/presentation/pages/notification/page/notification_screen.dart';
import 'package:medigo/features/Hospital/presentation/pages/setting/page/settings.dart';

class MainScreenHospital extends StatefulWidget {
  const MainScreenHospital({super.key, this.initialIndex});
  final int? initialIndex;

  @override
  State<MainScreenHospital> createState() => _MainScreenHospitalState();
}

class _MainScreenHospitalState extends State<MainScreenHospital> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex ?? 0;
  }

  @override
  void didUpdateWidget(covariant MainScreenHospital oldWidget) {
    super.didUpdateWidget(oldWidget);
    currentIndex = widget.initialIndex ?? currentIndex;
  }

  late final List<Widget> screens = [
    const HospitalHomeScreen(),
    const HospitalNotificationScreen(),
    AcceptedPatientsScreen(),
    const SettingsHospitalScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: screens[currentIndex],
      bottomNavigationBar: SafeArea(
        top: false, // remove space above nav bar
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            selectedItemColor: AppColors.primaryBlueColor,
            unselectedItemColor: isDark ? Colors.white70 : Colors.black54,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: _icon(AppIcons.homeMain, isDark ? Colors.white70 : Colors.black54),
                activeIcon: _icon(AppIcons.homeActivMain, AppColors.primaryBlueColor),
              ),
              BottomNavigationBarItem(
                label: 'Notifications',
                icon: _icon(AppIcons.NotificationSVG, isDark ? Colors.white70 : Colors.black54),
                activeIcon: _icon(AppIcons.notificationFill2, AppColors.primaryBlueColor),
              ),
              BottomNavigationBarItem(
                label: 'Accepted',
                icon: _icon(AppIcons.patient, isDark ? Colors.white70 : Colors.black54),
                activeIcon: _icon(AppIcons.patientFill, AppColors.primaryBlueColor),
              ),
              BottomNavigationBarItem(
                label: 'Setting',
                icon: _icon(AppIcons.settingMain, isDark ? Colors.white70 : Colors.black54),
                activeIcon: _icon(AppIcons.settingAcivMain, AppColors.primaryBlueColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon(String asset, Color color) => SizedBox(
        width: 25,
        height: 25,
        child: SvgPicture.asset(
          asset,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
      );
}
