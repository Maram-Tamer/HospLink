import 'package:flutter/material.dart';
import 'package:medigo/components/ScrrenBackgroung/background.dart';
import 'package:medigo/core/utils/fonts.dart';

class Home_H extends StatelessWidget {
  const Home_H({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        body: Column(children: [Text('Hospital',style: AppFontStyles.getSize24(),)],),
      ),
    );
  }
}