import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/features/Hospital/presentation/page/home.dart';

class Main_Screen_P extends StatefulWidget {
  Main_Screen_P({super.key, this.initialIndex});
  final int? initialIndex;
  @override
  State<Main_Screen_P> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen_P> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex ?? currentIndex;
  }

  @override
  void didUpdateWidget(covariant Main_Screen_P oldWidget) {
    super.didUpdateWidget(oldWidget);
    currentIndex = widget.initialIndex ?? currentIndex;
  }

  List<Widget> screens = [Home_H(), Home_H(), Home_H(), Home_H(), Home_H()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BlueBouttmnavigation,
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
            width: 30,
            height: 30,
            child: SvgPicture.asset(AppIcons.homeMain),
          ),
          activeIcon: SizedBox(
            width: 30,
            height: 30,
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
            width: 30,
            height: 30,
            child: SvgPicture.asset(AppIcons.favoritMain),
          ),
          activeIcon: SizedBox(
            width: 30,
            height: 30,
            child: SvgPicture.asset(
              AppIcons.favoritActivMain,
              colorFilter: ColorFilter.mode(
                AppColors.primaryGreenColor,
                BlendMode.srcIn,
              ),
            ),
          ),

          label: 'Favorit',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            width: 30,
            height: 30,
            child: SvgPicture.asset(AppIcons.hospitalMain),
          ),
          activeIcon: SizedBox(
            width: 30,
            height: 30,
            child: SvgPicture.asset(
              AppIcons.hospitalActivMain,
              colorFilter: ColorFilter.mode(
                AppColors.primaryGreenColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          label: 'Hospital',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            width: 30,
            height: 30,
            child: SvgPicture.asset(AppIcons.settingMain),
          ),
          activeIcon: SizedBox(
            width: 30,
            height: 30,
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
