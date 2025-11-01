import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-cubit.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Hospital/page/Hospital_step1.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Hospital/page/Hospital_step2.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Hospital/page/Hospital_step3.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/widget/bottom_navigation.dart';

class PageviewHospital extends StatefulWidget {
  PageviewHospital({super.key});

  @override
  State<PageviewHospital> createState() => _PageviewHospitalState();
}

class _PageviewHospitalState extends State<PageviewHospital> {
  PageController pageController = PageController();

  List<Widget> pages = [HospitalStep1(), HospitalStep2(), HospitalStep3()];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        itemBuilder: (context, index) {
          return pages[index];
        },
        onPageChanged: (value) {
          setState(() {
            currentindex = value;
          });
        },
        itemCount: 3,
      ),
      bottomNavigationBar: BottomNavigation(
        step: currentindex,
        pageController: pageController,
        route: Routes.login_H,
        cubit: context.read<AuthCubit>(),
      ),
    );
  }
}
