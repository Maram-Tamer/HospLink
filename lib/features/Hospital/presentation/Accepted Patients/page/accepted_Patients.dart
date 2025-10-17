import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Hospital/presentation/Accepted%20Patients/widget/cart_p_atient_accepted.dart';
import 'package:medigo/features/Hospital/presentation/Accepted%20Patients/widget/chooch_all_highpatient.dart';

class AcceptedPatientsScreen extends StatelessWidget {
   AcceptedPatientsScreen({super.key});

  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.blueLight,
        title: const Text('Accepted Patients'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ChoochAllHighpatient(isSelected: isSelected),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(top: 20),
              child: cartPAtientAccepted(),
            );
          },
          separatorBuilder: (context, index) {
            return Gap(0);
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
