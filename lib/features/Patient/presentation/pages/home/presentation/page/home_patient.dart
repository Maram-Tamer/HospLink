import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:medigo/features/Patient/presentation/pages/home/widget/hospital_card.dart';

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
          children: [searchAndFilters(), Gap(20), hospitalsListShow()],
        ),
      ),
    );
  }

  Container searchAndFilters() {
    return Container(
      color: AppColors.blueLight.withOpacity(0.8),
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
                color: AppColors.greyColor.withOpacity(0.7),
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
                      onPressed: (){
                        setState(() {
                          isNearest = true;
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
                        'Top Rated',
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
            Gap(15),
          ],
        ),
      ),
    );
  }

  Padding hospitalsListShow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child:FutureBuilder(
        future: FirebaseServices.getHospitals(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          HospitalModel hospitals;
          if (snapshot.hasData&&snapshot.data!.docs.isNotEmpty) {
            return ListView.separated(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              hospitals=HospitalModel.fromJson(snapshot.data!.docs[index].data() as Map<String, dynamic>);
              return HospitalCard(hospital: hospitals,);
            },
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) {
              return Gap(15);
            },
          );
          }
          return const Center(child: CircularProgressIndicator());
        },
      )
    );
  }
  }
