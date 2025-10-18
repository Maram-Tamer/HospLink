import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/features/Hospital/presentation/patient_details/presentation/widgets/patient_details_list.dart';
import 'package:medigo/features/Hospital/presentation/patient_details/presentation/widgets/patient_trailing.dart';
import 'package:medigo/features/patient/hospital_data/presentation/widgets/photo_card.dart';

// ignore: must_be_immutable
class PatientDetailsScreen extends StatefulWidget {
  PatientDetailsScreen({super.key, required this.isAccepted});
  bool isAccepted;

  @override
  State<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  final List<int> ratings = List.filled(3, 0);
  int currentRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: SizedBox(
            height: widget.isAccepted ? 70 : 130,
            child: PatientDetailsTrailing(widget: widget),
          ),
        ),
      ),
      appBar: App_Bar(
        title: "Patient Details",
        leading: widget.isAccepted ? false : true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hospital Header Image
              PhotoCard(image: AppImages.patientPNG, name: "Mohamed Samy"),
              const Gap(20),

              PatientDetailsList(),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
