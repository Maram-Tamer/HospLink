import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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
  bool isTopRated = true;
  Position? _currentPosition;
  List<Map<String, dynamic>> hospitalNearest = [];
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
            Gap(10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.greyColor.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Gap(5),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: isTopRated
                                  ? AppColors.primaryGreenColor
                                  : Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                isTopRated = true;
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
                              backgroundColor: isTopRated
                                  ? Colors.transparent
                                  : AppColors.primaryGreenColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              _getCurrentPosition();
                              if (_currentPosition != null) {
                                setState(() {
                                  isTopRated = false;
                                });
                              }
                            },
                            child: Text(
                              'Nearest',
                              style: AppFontStyles.getSize16(
                                fontColor: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                        Gap(5),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                      onPressed: () {
                        pushTo(context: context, route: Routes.Search);
                      },
                      icon: Icon(
                        size: 30,
                        Icons.search,
                        color: AppColors.greyColor,
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getHospitals() {
    return FutureBuilder(
      future: isTopRated
          ? FirebaseServices.getTopRatedHospitals(limit: 15)
          : _getNearestHospitalsOrdered(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData) {
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

        // لو Top Rated
        if (isTopRated) {
          var hospitals = snapshot.data.docs;
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
              ));
        }

        List<HospitalModel> gethospital = snapshot.data;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: gethospital.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return HospitalCard(
                hospital: gethospital[index],
                km: hospitalNearest[index]['km'],
              );
            },
          ),
        );
      },
    );
  }

  Future<List<HospitalModel>> _getNearestHospitalsOrdered() async {
    hospitalNearest.clear();

    var snapshot = await FirebaseServices.getNearestHospitals();
    var hospitals = snapshot.docs;

    for (int i = 0; i < hospitals.length; i++) {
      var hospitalData = hospitals[i].data() as Map<String, dynamic>;
      var hospitalModel = HospitalModel.fromJson(hospitalData);

      var lati = hospitalModel.locationLati;
      var long = hospitalModel.locationLong;

      double km = calculateDistance(
        lat1: _currentPosition!.latitude,
        lat2: double.parse(lati ?? '0'),
        lon1: _currentPosition!.longitude,
        lon2: double.parse(long ?? '0'),
      );

      hospitalNearest.add({'id': hospitalModel.uid, 'km': km});
    }

    hospitalNearest.sort((a, b) => a['km'].compareTo(b['km']));

    List<Future<HospitalModel>> futures = [];
    for (int i = 0; i < hospitalNearest.length; i++) {
      futures.add(FirebaseServices.getHospitalById(hospitalNearest[i]['id']));
    }

    // انتظار كل البيانات
    List<HospitalModel> orderedHospitals = await Future.wait(futures);

    return orderedHospitals;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 50,
      ),
    ).then((Position position) {
      setState(() async {
        _currentPosition = position;
      });
    }).catchError((e) {
      log(e.toString());
    });
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Location services are disabled. Please enable the services',
          ),
        ),
      );
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')),
        );
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Location permissions are permanently denied, we cannot request permissions.',
          ),
        ),
      );
      return false;
    }
    return true;
  }
}
