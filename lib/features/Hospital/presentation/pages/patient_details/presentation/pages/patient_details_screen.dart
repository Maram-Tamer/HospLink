import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/features/Hospital/presentation/pages/patient_details/presentation/widgets/patient_details_list.dart';
import 'package:medigo/features/Hospital/presentation/pages/patient_details/presentation/widgets/patient_trailing.dart';
import 'package:medigo/features/Patient/data/model/request-model.dart';
import 'package:medigo/features/Patient/presentation/pages/hospital_data/presentation/widgets/photo_card.dart';

// ignore: must_be_immutable
class PatientDetailsScreen extends StatefulWidget {
  PatientDetailsScreen({super.key,required this.data});
  final Map<String, dynamic> data;

  @override
  State<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  final List<int> ratings = List.filled(3, 0);
  int currentRating = 0;
  @override
  Widget build(BuildContext context) {
     final RequestModel request=widget.data["request"];
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: SizedBox(
            height: widget.data["isAccepted"] ? 70 : 130,
            child: PatientDetailsTrailing(widget: widget),
          ),
        ),
      ),
      appBar: App_Bar(
        title: "Patient Details",
        leading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hospital Header Image
              PhotoCard(image: request.imageProfilePath??AppImages.PatientPhoto1, name:request.name??''),
              const Gap(20),
              PatientDetailsList(request: request,),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
