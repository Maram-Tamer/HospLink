import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Patient/presentation/cubit/patient-cubit.dart';
import 'package:medigo/features/Patient/presentation/cubit/patient-state.dart';
import 'package:medigo/features/patient/presentation/pages/home/presentation/widget/hospital_card.dart';

class FavouritePatient extends StatefulWidget {
  const FavouritePatient({super.key});

  @override
  State<FavouritePatient> createState() => _FavouritePatientState();
}

class _FavouritePatientState extends State<FavouritePatient> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive font size
    final responsiveFontSize = screenWidth * 0.06;

    // AppBar text color based on theme
    final appBarTextColor =
        theme.brightness == Brightness.dark ? Colors.white : Colors.black;

    return BlocProvider(
      create: (BuildContext context) =>
          PatientCubit()..getFavoriteHospitals(),
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor, // plain background
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Favourites',
            style: AppFontStyles.getSize24(
              fontWeight: FontWeight.w600,
              fontColor: appBarTextColor,
              fontSize: responsiveFontSize,
            ),
          ),
        ),
        body: BlocBuilder<PatientCubit, PatientState>(
          builder: (context, state) {
            var cubit = context.read<PatientCubit>();

            // Show placeholder if no favourite hospitals
            if (cubit.favoriteHospitals.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/Hospital_welcom.png',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                    const Gap(30),
                    Text(
                      'No Favourite Hospitals',
                      style: TextStyle(
                        fontSize: responsiveFontSize * 0.7,
                        fontWeight: FontWeight.bold,
                        color: appBarTextColor,
                      ),
                    ),
                  ],
                ),
              );
            }

            // Show list of favourite hospitals
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.separated(
                  itemCount: cubit.favoriteHospitals.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return HospitalCard(
                      submitRequest: true,
                      hospital: cubit.favoriteHospitals[index],
                    );
                  },
                  separatorBuilder: (context, index) => const Gap(15),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
