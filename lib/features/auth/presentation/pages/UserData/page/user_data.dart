import 'package:flutter/material.dart';
import 'package:medigo/core/utils/colors.dart';

class EnderUserData extends StatelessWidget {
  const EnderUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Your data')),
      backgroundColor: AppColors.whiteColor,
    );
  }
}
