import 'package:flutter/material.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/components/ScrrenBackgroung/background.dart';
import 'package:medigo/features/auth/presentation/pages/forget_password/widgets/forget_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(child: Scaffold(body: ForgetBody(),appBar: App_Bar(leading: true,),));
  }
}
