import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/features/Hospital/presentation/Accepted%20Patients/page/accepted_Patients.dart';
import 'package:medigo/features/Hospital/presentation/page/home.dart';
import 'package:medigo/features/Hospital/presentation/setting/page/settings.dart';
import 'package:medigo/features/Patient/favourite/presentation/page/favourite_patient.dart';
import 'package:medigo/features/Patient/home/presentation/page/home_patient.dart';
import 'package:medigo/features/Patient/hospital_data/presentation/pages/hospital_details_screen.dart';
import 'package:medigo/features/Patient/setting/page/settings.dart';

class Main_Screen_H extends StatefulWidget {
  const Main_Screen_H({super.key, this.initialIndex});
  final int? initialIndex;
  @override
  State<Main_Screen_H> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen_H> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex ?? currentIndex;
  }

  @override
  void didUpdateWidget(covariant Main_Screen_H oldWidget) {
    super.didUpdateWidget(oldWidget);
    currentIndex = widget.initialIndex ?? currentIndex;
  }

  List<Widget> screens = [
    HomePatient(),
    FavouritePatient(),
    AcceptedPatientsScreen(),
    SettingsHospitalScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueLight,
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: _BottomNavigation(),
      ),
    );
  }

  BottomNavigationBar _BottomNavigation() {
    return BottomNavigationBar(
      elevation: 0,

      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      items: [
        BottomNavigationBarItem(
          icon: SizedBox(
            width: 25,
            height: 25,
            child: SvgPicture.asset(AppIcons.homeMain),
          ),
          activeIcon: SizedBox(
            width: 25,
            height: 25,
            child: SvgPicture.asset(
              AppIcons.homeActivMain,
              colorFilter: ColorFilter.mode(
                AppColors.primaryGreenColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            width: 25,
            height: 25,
            child: SvgPicture.asset(AppIcons.NotificationSVG),
          ),
          activeIcon: SizedBox(
            width: 25,
            height: 25,
            child: SvgPicture.asset(
              AppIcons.notificationFill2,
              colorFilter: ColorFilter.mode(
                AppColors.primaryGreenColor,
                BlendMode.srcIn,
              ),
            ),
          ),

          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            width: 25,
            height: 25,
            child: SvgPicture.asset(AppIcons.patient),
          ),
          activeIcon: SizedBox(
            width: 25,
            height: 25,
            child: SvgPicture.asset(
              AppIcons.patientFill,
              colorFilter: ColorFilter.mode(
                AppColors.primaryGreenColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          label: 'Accepted ',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            width: 25,
            height: 25,
            child: SvgPicture.asset(AppIcons.settingMain),
          ),
          activeIcon: SizedBox(
            width: 25,
            height: 25,
            child: SvgPicture.asset(
              AppIcons.settingAcivMain,
              colorFilter: ColorFilter.mode(
                AppColors.primaryGreenColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          label: 'Setting',
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
  }
}
