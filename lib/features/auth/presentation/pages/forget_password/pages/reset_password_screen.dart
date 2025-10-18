import 'package:flutter/material.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/ScrrenBackgroung/background.dart';
import 'package:medigo/features/auth/presentation/pages/forget_password/widgets/reset_pass_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key , required this.route});
  final String route;

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(body: ResetPassBody(route: route,), appBar: App_Bar(leading: true)),
    );
  }
}
