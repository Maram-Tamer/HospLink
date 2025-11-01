import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-cubit.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Patient/page/Patient_step1.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Patient/page/Patient_step2.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Patient/page/Patient_step3.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/widget/bottom_navigation.dart';

class PageviewPatient extends StatefulWidget {
  PageviewPatient({super.key});

  @override
  State<PageviewPatient> createState() => _PageviewPatientState();
}

class _PageviewPatientState extends State<PageviewPatient> {
  PageController pageController = PageController();

  List<Widget> pages = [PatientStep1(), PatientStep2(), PatientStep3()];
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
            //log('====> ${currentindex}');
          });
        },
        itemCount: 3,
      ),
      bottomNavigationBar: BottomNavigation(
        step: currentindex,
        pageController: pageController,
        route: Routes.login_P,
        cubit: context.read<AuthCubit>(),
      ),
    );
  }
}
