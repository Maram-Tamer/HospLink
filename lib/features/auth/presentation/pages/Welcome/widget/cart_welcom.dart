import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';

class cartWelcom extends StatelessWidget {
  cartWelcom({
    super.key,
    required this.image,
    required this.routeLogin,
    required this.routeRegister,
  });
  String image;
  String routeLogin;
  String routeRegister;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: Image.asset(image),
        ),
        Gap(20),
        MainButton(
          width: 350,
          buttonText: 'Login',
          onPressed: () {
            pushTo(context: context, route: routeLogin);
          },
          textColor: AppColors.whiteColor,
        ),
        Gap(20),
        MainButton(
          width: 350,
          buttonText: 'Sign Up',
          onPressed: () {
            pushTo(context: context, route: routeRegister);
          },
          textColor: AppColors.primaryGreenColor,
          buttomColor: AppColors.whiteColor,
          borderColor: AppColors.primaryGreenColor,
        ),
      ],
    );
  }
}
