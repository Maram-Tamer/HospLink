import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Hospital/data/model/doctor-model.dart';
import 'package:medigo/features/patient/presentation/pages/home/widget/hospital_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = "";
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () => pop(context),
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchText = value.trim();
                });
              },
              decoration: InputDecoration(
                hintText: 'Search for a Hospital',
                filled: true,
                fillColor: const Color(0xFFF5F5F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const Gap(20),
            Row(
              children: [
                const Text(
                  'Recent Searches',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text('Clear',
                        style: AppFontStyles.getSize14(
                          fontColor: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                        )))
              ],
            ),
            const Gap(20),
            Expanded(
              child: searchText.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppIcons.searchSVG,
                          height: 100,
                          colorFilter: ColorFilter.mode(
                              AppColors.primaryGreenColor, BlendMode.srcIn),
                        ),
                        Gap(10),
                        Text(
                          textAlign: TextAlign.center,
                          "Please enter Hospital name \nto search",
                          style: AppFontStyles.getSize18(
                              fontWeight: FontWeight.w600,
                              fontColor: AppColors.primaryGreenColor),
                        ),
                      ],
                    )
                  : FutureBuilder<QuerySnapshot>(
                      future: FirebaseServices.searchHospitals(searchText),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (snapshot.data!.docs.isEmpty) {
                          return const EmptySearch();
                        }

                        return ListView.separated(
                          separatorBuilder: (context, index) => const Gap(10),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            HospitalModel hospital = HospitalModel.fromJson(
                              snapshot.data!.docs[index].data()
                                  as Map<String, dynamic>,
                            );

                            return HospitalCard(hospital: hospital);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmptySearch extends StatelessWidget {
  const EmptySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppIcons.hospitalMain,
          height: 100,
          colorFilter:
              ColorFilter.mode(AppColors.primaryGreenColor, BlendMode.srcIn),
        ),
        const SizedBox(height: 10),
        Text(
          'No hospitals found',
          style: AppFontStyles.getSize18(
              fontColor: AppColors.primaryGreenColor,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
