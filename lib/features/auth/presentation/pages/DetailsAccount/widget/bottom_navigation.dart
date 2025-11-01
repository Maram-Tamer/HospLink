import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/core/extentions/uploadCloudinary.dart';
import 'package:medigo/core/extentions/show_dialoges.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/features/auth/presentation/cubit/auth-cubit.dart';

class BottomNavigation extends StatelessWidget {
  final int step;
  final String route;
  final PageController pageController;
  AuthCubit cubit;
  BottomNavigation(
      {super.key,
      required this.step,
      required this.route,
      required this.pageController,
      required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: (step == 0)
              ? MainAxisAlignment.end // لو أول صفحة الزر ناحية اليمين
              : MainAxisAlignment.spaceBetween,
          children: [
            // زر Back (يظهر من الصفحة الثانية فصاعدًا)
            if (step > 0)
              Expanded(
                child: MainButton(
                  buttonText: 'Back',
                  onPressed: () {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  height: 45,
                ),
              ),
            if (step > 0) const Gap(20),

            // زر Next أو Done
            if (step == 0)
              MainButton(
                width: 185,
                buttonText: 'Next',
                onPressed: () async {
                  //step 1
                  if (cubit.formKey1.currentState!.validate()) {
                    if (cubit.imageUri == null) {
                      showMyDialog(context, 'please select image');
                    } else if (cubit.radiGroub == null) {
                      showMyDialog(context, 'please select all Data');
                    } else {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  }
                },
                height: 45,
              )
            else
              Expanded(
                child: MainButton(
                  buttonText: (step == 2) ? 'Done' : 'Next',
                  onPressed: () async {
                    if (step < 2) {
                      //step 2
                      if (cubit.formKey2.currentState!.validate()) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    } else {
                      //step 3

                      if (route == Routes.login_P) {
                        //Patient
                        if (cubit.booldController.selectedIndex != null) {
                          cubit.createpatient(context);
                          pushAndRemoveUntil(
                              context: context, route: Routes.welcom);
                          pushTo(
                            context: context,
                            route: route,
                          );
                        } else {
                          showMyDialog(context, 'enter all Data');
                        }
                      } else {
                        //hospital
                        if (cubit.formKey3.currentState!.validate()) {
                          if (cubit.positionLati != null &&
                              cubit.fileDoc != null) {
                            cubit.createHosptial(context);
                            pushAndRemoveUntil(
                                context: context, route: Routes.welcom);
                            pushTo(
                              context: context,
                              route: route,
                            );
                          } else {
                            showMyDialog(
                                context, 'please select doc & Location');
                          }
                        }
                      }
                    }
                  },
                  height: 45,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
