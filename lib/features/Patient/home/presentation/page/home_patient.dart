import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/ScrrenBackgroung/background.dart';
import 'package:medigo/components/inputs/main_text_form_field.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Patient/widgets/hospital_card.dart';

class HomePatient extends StatefulWidget {
  const HomePatient({super.key});

  @override
  State<HomePatient> createState() => _HomePatientState();
}

class _HomePatientState extends State<HomePatient> {
  bool isNearest = true;
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hospitals', style: AppFontStyles.getSize24()),
          backgroundColor: Colors.grey.shade100,
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications, color: AppColors.slateGrayColor),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [searchAndFilters(), Gap(20), hospitalsListShow()],
          ),
        ),
      ),
    );
  }

  Container searchAndFilters() {
    return Container(
      color: AppColors.grey2Color.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Gap(20),
            MainTextFormField(
              ispassword: false,
              label: 'Search',
              prefixIcon: 'assets/icons/search.svg',
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
                      onPressed: () {
                        setState(() {
                          isNearest = !isNearest;
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
                          isNearest = !isNearest;
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
      child: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return HospitalCard();
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
