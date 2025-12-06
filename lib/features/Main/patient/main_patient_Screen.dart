import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/utils/colors.dart';

// Aliased imports to avoid conflicts
import 'package:medigo/features/Patient/presentation/pages/favourite/presentation/page/favourite_patient.dart' as fav;
import 'package:medigo/features/Patient/presentation/pages/requests/page/requests_patient.dart' as req;
import 'package:medigo/features/Patient/presentation/pages/home/presentation/page/home_patient.dart';
import 'package:medigo/features/Patient/presentation/pages/setting/page/settings.dart';

class MainScreenPatient extends StatefulWidget {
  const MainScreenPatient({super.key, this.initialIndex});
  final int? initialIndex;

  @override
  State<MainScreenPatient> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreenPatient> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex ?? 0;
  }

  @override
  void didUpdateWidget(covariant MainScreenPatient oldWidget) {
    super.didUpdateWidget(oldWidget);
    currentIndex = widget.initialIndex ?? currentIndex;
  }

  late final List<Widget> screens = [
    HomePatient(),
    fav.FavouritePatient(),  // Using alias fav
    req.RequestsPatient(),   // Using alias req
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: _bottomNavigation(colorScheme, isDark),
      ),
    );
  }

  BottomNavigationBar _bottomNavigation(ColorScheme colorScheme, bool isDark) {
    Color activeColor = AppColors.primaryBlueColor;
    Color inactiveColor = isDark ? Colors.white70 : Colors.black54;

    return BottomNavigationBar(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      selectedItemColor: activeColor,
      unselectedItemColor: inactiveColor,
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: _icon(AppIcons.homeMain, inactiveColor),
          activeIcon: _icon(AppIcons.homeActivMain, activeColor),
        ),
        BottomNavigationBarItem(
          label: 'Favourite',
          icon: _icon(AppIcons.favoritMain, inactiveColor),
          activeIcon: _icon(AppIcons.favoritActivMain, activeColor),
        ),
        BottomNavigationBarItem(
          label: 'Requests',
          icon: _icon(AppIcons.hospitalMain, inactiveColor),
          activeIcon: _icon(AppIcons.hospitalActivMain, activeColor),
        ),
        BottomNavigationBarItem(
          label: 'Setting',
          icon: _icon(AppIcons.settingMain, inactiveColor),
          activeIcon: _icon(AppIcons.settingAcivMain, activeColor),
        ),
      ],
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
