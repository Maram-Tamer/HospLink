import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Hospital/data/model/doctor-model.dart';
import 'package:medigo/features/Patient/presentation/pages/home/presentation/widget/calc.dart';
import 'package:medigo/features/Patient/presentation/pages/home/widget/hospital_card.dart';

// ignore: must_be_immutable
class HomePatient extends StatefulWidget {
  const HomePatient({super.key});

  @override
  State<HomePatient> createState() => _HomePatientState();
}

class _HomePatientState extends State<HomePatient> {
  bool isNearest = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(
        title: 'Hospitals',
        action: true,
        icon: AppIcons.notificationFill,
        onPressAction: () {
          pushTo(context: context, route: Routes.Notification);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [searchAndFilters(), Gap(20), getHospitals(), Gap(15)],
        ),
      ),
    );
  }

  Container searchAndFilters() {
    return Container(
      color: AppColors.blueLight.withValues(alpha: 0.8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Gap(20),
            GestureDetector(
              onTap: () {
                pushTo(context: context, route: Routes.Search);
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.fillTextForm,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.greyColor),
                ),
                child: Row(
                  children: [
                    Gap(15),
                    Icon(Icons.search, color: AppColors.darkGreyColor),
                    Gap(10),
                    Text(
                      'Search for hospital',
                      style: AppFontStyles.getSize16(
                        fontColor: AppColors.darkGreyColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(20),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.greyColor.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Gap(15),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: isNearest
                            ? AppColors.primaryGreenColor
                            : Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          isNearest = true;
                        });
                      },
                      child: Text(
                        'Top Rated',
                        style: AppFontStyles.getSize16(
                          fontColor: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  Gap(5),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: isNearest
                            ? Colors.transparent
                            : AppColors.primaryGreenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          isNearest = false;
                        });
                      },
                      child: Text(
                        'Nearest',
                        style: AppFontStyles.getSize16(
                          fontColor: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  Gap(15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getHospitals() {
    return FutureBuilder(
      future: isNearest
          ? FirebaseServices.getTopRatedHospitals(limit: 15)
          : FirebaseServices.getNearestHospitals(),
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
                    fontColor: AppColors.primaryGreenColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          );
        }

        var hospitals = snapshot.data.docs;
        log('${HospitalModel.fromJson(hospitals[1].data() as Map<String, dynamic>).email}    ;   ${hospitals}');

        if (isNearest) {
          List<Map<String, dynamic>> hospitalNearest = [];
          for (int i = 0; i < hospitals.length; i++) {
            var lati = HospitalModel.fromJson(
                    hospitals[i].data() as Map<String, dynamic>)
                .locationLati;
            var long = HospitalModel.fromJson(
                    hospitals[i].data() as Map<String, dynamic>)
                .locationLong;
            double Km = calculateDistance(
                lat1: 30.118587119723703,
                lat2: double.parse(lati ?? ''),
                lon1: 31.274240270901586,
                lon2: double.parse(long ?? ''));
            hospitalNearest.add({
              'id': HospitalModel.fromJson(
                      hospitals[i].data() as Map<String, dynamic>)
                  .uid,
              'km': Km
            });
          }
          hospitalNearest.sort((a, b) => a['km'].compareTo(b['km']));
          // log('*/******************${hospital}');
          var x;
          for (int i = 0; i < hospitals.length; i++) {
            FirebaseServices.getHospitalsById(hospitalNearest[i]['id']);
          }
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: hospitals.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              HospitalModel hospital = HospitalModel.fromJson(
                hospitals[index].data() as Map<String, dynamic>,
              );
              return HospitalCard(hospital: hospital);
            },
          ),
        );
      },
    );
  }
}
