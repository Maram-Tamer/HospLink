import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/features/Hospital/data/model/doctor-model.dart';
import 'package:medigo/features/Patient/presentation/pages/home/presentation/widget/get_hospitals.dart';
import 'package:medigo/features/Patient/presentation/pages/home/widget/hospital_card.dart';

class getHospitals extends StatelessWidget {
  const getHospitals({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child:FutureBuilder(
        future: FirebaseServices.getHospitals(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          HospitalModel hospitals;
          if (snapshot.hasData&&snapshot.data!.docs.isNotEmpty) {
            return ListView.separated(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              hospitals=HospitalModel.fromJson(snapshot.data!.docs[index].data() as Map<String, dynamic>);
              return HospitalCard(hospital: hospitals,);
            },
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) {
              return Gap(15);
            },
          );
          }
          return const Center(child: CircularProgressIndicator());
        },
      )
    );
  }
}
