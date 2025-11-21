
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/core/services/local/local-helper.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Hospital/presentation/pages/home/widgets/patient_card.dart';
import 'package:medigo/features/Patient/data/model/request-model.dart';

class HospitalHomeScreen extends StatelessWidget {
  const HospitalHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log(LocalHelper.getUserId()??'');
    return Scaffold(
      appBar: AppBar(
        title: Text('Requests'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
      future: FirebaseServices.getRequests(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No hospitals found',
                style: AppFontStyles.getSize18(
                    fontColor: AppColors.primaryGreenColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          );
        }
        var requests = snapshot.data.docs;
        List<RequestModel> requestsList = [];
        for (var request in requests) {
          if(request.data()['state'] == "Pending"){
          requestsList.add(RequestModel.fromJson(request.data() as Map<String, dynamic>));
        }}
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: requestsList.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final request = requestsList[index];
              return PatientCardForHospitalHome(request: request,);
            },
          ),
        );
      },
    ),
      ),
    );}
}
