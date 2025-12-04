import 'package:flutter/material.dart';
import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Hospital/presentation/pages/Accepted%20Patients/widget/cart_p_atient_accepted.dart';
import 'package:medigo/features/Patient/data/model/request-model.dart';

// ignore: must_be_immutable
class AcceptedPatientsScreen extends StatelessWidget {
  AcceptedPatientsScreen({super.key});

  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get theme

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary, // theme-aware
        title: Text(
          'Accepted Patients',
          style: theme.textTheme.titleMedium
              ?.copyWith(color: theme.colorScheme.onPrimary), // theme-aware
        ),
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
                      fontColor: theme.colorScheme.primary, // theme-aware
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              );
            }

            var requests = snapshot.data.docs;
            List<RequestModel> requestsList = [];
            for (var request in requests) {
              if (request.data()['state'] == "Accepted") {
                requestsList
                    .add(RequestModel.fromJson(request.data() as Map<String, dynamic>));
              }
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: requestsList.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final request = requestsList[index];
                  return cartPAtientAccepted(request: request);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
