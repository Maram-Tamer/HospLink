import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/ScrrenBackgroung/background.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Hospital/data/model/doctor-model.dart';
import 'package:medigo/features/Patient/presentation/pages/home/widget/hospital_card.dart';

class FavouritePatient extends StatefulWidget {
  const FavouritePatient({super.key});

  @override
  State<FavouritePatient> createState() => _FavouritePatientState();
}

class _FavouritePatientState extends State<FavouritePatient> {
  bool isNearest = true;
  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Favourite', style: AppFontStyles.getSize24()),
        ),
        body: SingleChildScrollView(
          child: Column(children: [Gap(15), hospitalsListShow(), Gap(15)]),
        ),
      ),
    );
  }

  Padding hospitalsListShow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return HospitalCard(
            submitRequest: true,
            hospital: HospitalModel(),
          );
        },
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) {
          return Gap(15);
        },
      ),
    );
  }
}
