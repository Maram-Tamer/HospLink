import 'package:flutter/material.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/ScrrenBackgroung/background.dart';
import 'package:medigo/features/auth/presentation/pages/forget_password/widgets/otp_pverfication_body.dart';

class OtpVerficationScreen extends StatelessWidget {
  const OtpVerficationScreen({super.key,required this.route});
  final String route;

  @override
  Widget build(BuildContext context) {
    return AppBackground(child: Scaffold(body: OTPverficationBody(route: route,),appBar: App_Bar(leading: true,),));
  }
}
