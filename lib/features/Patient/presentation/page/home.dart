import 'package:flutter/material.dart';
import 'package:medigo/components/ScrrenBackgroung/background.dart';
import 'package:medigo/core/utils/fonts.dart';

class Home_P extends StatelessWidget {
  const Home_P({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        body: Column(children: [Text('Patient',style: AppFontStyles.getSize24(),)],),
      ),
    );
  }
}