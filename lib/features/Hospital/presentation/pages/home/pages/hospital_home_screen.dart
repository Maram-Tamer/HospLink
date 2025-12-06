import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/core/services/local/local-helper.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Hospital/presentation/pages/home/widgets/patient_card.dart';
import 'package:medigo/features/Patient/data/model/request-model.dart';

class HospitalHomeScreen extends StatelessWidget {
  const HospitalHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    log(LocalHelper.getUserId() ?? '');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: theme.textTheme.titleMedium
              ?.copyWith(color: theme.colorScheme.onPrimary, fontSize: 22, fontWeight: FontWeight.w600),
        ),
        backgroundColor: theme.colorScheme.primary,
      ),

      body: FutureBuilder(
        future: FirebaseServices.getRequests(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: theme.colorScheme.onBackground),
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.profileWelcom, width: 50, height: 50,),
                  Gap(  10),
                  Text(
                    'No pending cases found',
                    style: AppFontStyles.getSize18(
                      fontColor: theme.colorScheme.onSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          }

          var requests = snapshot.data.docs;
          List<RequestModel> requestsList = [];

          for (var request in requests) {
            if (request.data()['state'] == "Pending") {
              requestsList.add(
                RequestModel.fromJson(
                  request.data() as Map<String, dynamic>,
                ),
              );
            }
          }

          if (requestsList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.profileWelcom, width: 50, height: 50,),
                  Text(
                    'No pending cases found',
                    style: AppFontStyles.getSize18(
                      fontColor: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(30),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: requestsList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final request = requestsList[index];
                return PatientCardForHospitalHome(request: request);
              },
            ),
          );
        },
      ),
    );
  }
}
