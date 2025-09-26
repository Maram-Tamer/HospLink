import 'package:flutter/material.dart';
import 'package:medigo/features/auth/presentation/pages/forget_password/widgets/reset_pass_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ResetPassBody());
  }
}
