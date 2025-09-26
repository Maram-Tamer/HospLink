import 'package:flutter/material.dart';
import 'package:medigo/features/auth/presentation/pages/forget_password/widgets/otp_pverfication_body.dart';

class OtpVerficationScreen extends StatelessWidget {
  const OtpVerficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OTPverficationBody());
  }
}
