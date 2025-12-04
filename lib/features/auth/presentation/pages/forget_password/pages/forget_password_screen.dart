import 'package:flutter/material.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/screen_background/background.dart';
import 'package:medigo/features/auth/presentation/pages/forget_password/widgets/forget_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key, required this.route});
  final String route;

  @override
  Widget build(BuildContext context) {
    return AppBackground(child: Scaffold(body: ForgetBody(route: route,),appBar: MainAppBar(leading: true,),));
  }
}
