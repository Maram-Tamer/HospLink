import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/features/Hospital/data/model/hospital-model.dart';
import 'package:medigo/features/Patient/data/model/getRequestModel.dart';
import 'package:medigo/features/Patient/data/model/request-model.dart';
import 'package:medigo/features/Patient/presentation/cubit/patient-cubit.dart';
import 'package:medigo/features/Patient/presentation/pages/home/widget/hospital_card.dart';
import 'package:medigo/features/Patient/presentation/pages/requests/page/requestScreen.dart';

class RequestsPatient extends StatelessWidget {
  const RequestsPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(
        title: 'Requests',
      ),
      body: BlocProvider(
        create: (context) => PatientCubit(),
        child: StreamBuilder<List<RequestWithHospital>>(
          stream: FirebaseServices.getRequestsPatient(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No Requests"));
            }

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
            return ListView.separated(
                itemBuilder: (context, index) {
                  if (!snapshot.hasData) {
                    return Center(child: Text('No Data'));
                  }
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
                separatorBuilder: (context, index) {
                  return Gap(10);
                },
                itemCount: snapshot.data!.length);
          },
        ),
      ),
    );
  }
}
