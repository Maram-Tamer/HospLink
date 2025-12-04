import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/features/Hospital/data/model/hospital-model.dart';
import 'package:medigo/features/Patient/data/model/getRequestModel.dart';
import 'package:medigo/features/Patient/data/model/request-model.dart';
import 'package:medigo/features/Patient/presentation/cubit/patient-cubit.dart';
import 'package:medigo/features/Patient/presentation/pages/requests/page/requestScreen.dart';
import 'package:medigo/features/patient/presentation/pages/home/presentation/widget/hospital_card.dart';

class RequestsPatient extends StatelessWidget {
  const RequestsPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Requests',
      ),
      body: BlocProvider(
        create: (context) => PatientCubit(),
        child: StreamBuilder<List<RequestWithHospital>>(
          stream: FirebaseServices.getRequestsPatient(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            // Show Lottie animation if no requests
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppImages.profileWelcom, width: 50, height: 50,
                    fit: BoxFit.cover,
                    ),
                    const Gap(10),
                    const Text(
                      "No Requests",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }

            // If only 1 request
            if (snapshot.hasData && snapshot.data!.length == 1) {
              final items = snapshot.data!;
              final hospital = items[0].hospital;
              final request = items[0].request;

              return Requestscreen(
                data: {
                  'hospital': HospitalModel.fromJson(hospital),
                  'request': RequestModel.fromJson(request),
                },
                accepted: true,
              );
            }

            // Multiple requests
            return ListView.separated(
              itemBuilder: (context, index) {
                final items = snapshot.data!;
                final hospital = items[index].hospital;
                final request = items[index].request;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: HospitalCard(
                    hospital: HospitalModel.fromJson(hospital),
                    request: RequestModel.fromJson(request),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Gap(10),
              itemCount: snapshot.data!.length,
            );
          },
        ),
      ),
    );
  }
}
