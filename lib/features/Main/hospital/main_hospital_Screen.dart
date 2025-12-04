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
  int currentIndex = 0;

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

  final List<Widget> screens = [
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
      backgroundColor: AppColors.blueLight,
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface, // theme-responsive
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: _BottomNavigation(colorScheme, isDark),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  BottomNavigationBar _BottomNavigation(ColorScheme colorScheme, bool isDark) {
    return BottomNavigationBar(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      currentIndex: currentIndex,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.primaryBlueColor,
      unselectedItemColor: isDark ? Colors.white : Colors.black,
      onTap: (index) {
        setState(() => currentIndex = index);
      },
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: _icon(AppIcons.homeMain, isDark),
          activeIcon: _activeIcon(AppIcons.homeActivMain),
        ),
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: _icon(AppIcons.NotificationSVG, isDark),
          activeIcon: _activeIcon(AppIcons.notificationFill2),
        ),
        BottomNavigationBarItem(
          label: 'Accepted',
          icon: _icon(AppIcons.patient, isDark),
          activeIcon: _activeIcon(AppIcons.patientFill),
        ),
        BottomNavigationBarItem(
          label: 'Setting',
          icon: _icon(AppIcons.settingMain, isDark),
          activeIcon: _activeIcon(AppIcons.settingAcivMain),
        ),
      ],
    );
  }

  Widget _icon(String asset, bool isDark) => SizedBox(
        width: 25,
        height: 25,
        child: SvgPicture.asset(
          asset,
          colorFilter: ColorFilter.mode(
            isDark ? Colors.white : Colors.black,
            BlendMode.srcIn,
          ),
        ),
      );

  Widget _activeIcon(String asset) => SizedBox(
        width: 25,
        height: 25,
        child: SvgPicture.asset(
          asset,
          colorFilter: const ColorFilter.mode(
            AppColors.primaryBlueColor,
            BlendMode.srcIn,
          ),
        ),
      );
}
