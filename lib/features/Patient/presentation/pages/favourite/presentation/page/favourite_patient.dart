import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/ScrrenBackgroung/background.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Patient/presentation/cubit/patient-cubit.dart';
import 'package:medigo/features/Patient/presentation/cubit/patient-state.dart';
import 'package:medigo/features/Patient/presentation/pages/home/widget/hospital_card.dart';

class FavouritePatient extends StatefulWidget {
  const FavouritePatient({super.key});

  @override
  State<FavouritePatient> createState() => _FavouritePatientState();
}

class _FavouritePatientState extends State<FavouritePatient> {
  bool isNearest = true;
  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: BlocProvider(
        create: (BuildContext context) { 
          return PatientCubit()..getFavoriteHospitals();
         },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Favourites', style: AppFontStyles.getSize24(fontWeight: FontWeight.w600)),
          ),
          body: BlocBuilder<PatientCubit,PatientState>(
            builder: (context, state) {
              var cubit=context.read<PatientCubit>();
              return SingleChildScrollView(
              child: Column(children: [Gap(15), hospitalsListShow(cubit), Gap(15)]),
            );
            }, 
          ),
        ),
      ),
    );
  }

Widget hospitalsListShow(PatientCubit cubit) {
  print(cubit.favoriteHospitals);
    if (cubit.favoriteHospitals.isEmpty) {
       return Center(child: Text('No Favourite Hospitals',style: AppFontStyles.getSize14(fontWeight: FontWeight.w600),));
    }else{
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ListView.separated(
        itemCount: cubit.favoriteHospitals.length,
        itemBuilder: (context, index) {
          return HospitalCard(
            submitRequest: true,
            hospital: cubit.favoriteHospitals[index],
          );
        },
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) {
          return Gap(15);
        },
      ),
    );
    }
  }
}
