import 'package:flutter/material.dart';
import 'package:medigo/core/utils/assets.dart';
import 'package:medigo/core/utils/colors.dart';

class Ender_UserData extends StatelessWidget {
  const Ender_UserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Your data'),
      ),
      backgroundColor:AppColors.whiteColor,

    );
  }
}