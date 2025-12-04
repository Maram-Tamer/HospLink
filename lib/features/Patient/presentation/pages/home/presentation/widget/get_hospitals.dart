import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/features/Hospital/data/model/hospital-model.dart';
import 'package:medigo/features/patient/presentation/pages/home/presentation/widget/hospital_card.dart';

class GetHospitalsList extends StatelessWidget {
  const GetHospitalsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get the theme's color scheme for responsive styling
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: FutureBuilder<QuerySnapshot>(
        future: FirebaseServices.getHospitals(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          
          // --- 1. Loading State ---
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              // Use the primary theme color for the indicator
              color: colorScheme.primary,
            ));
          }
          
          // --- 2. Error State ---
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: Failed to load hospital data.',
                style: TextStyle(
                  // Use the error theme color for the message
                  color: colorScheme.error,
                  fontSize: 16,
                ),
              ),
            );
          }

          final documents = snapshot.data?.docs;
          
          // --- 3. Empty Data State ---
          if (documents == null || documents.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Text(
                  'No hospitals found.',
                  style: TextStyle(
                    // Use the primary text color (onSurface)
                    color: colorScheme.onSurface,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }

          // --- 4. Data Loaded State ---
          return ListView.separated(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final hospitalData = documents[index].data() as Map<String, dynamic>;
              final hospital = HospitalModel.fromJson(hospitalData);
              
              return HospitalCard(
                hospital: hospital,
                // km parameter removed if not available here
              );
            },
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) {
              return const Gap(15);
            },
          );
        },
      ),
    );
  }
}