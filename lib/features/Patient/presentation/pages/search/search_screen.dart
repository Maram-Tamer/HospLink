import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Hospital/data/model/hospital-model.dart';
import 'package:medigo/features/patient/presentation/pages/home/presentation/widget/hospital_card.dart';

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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final size = MediaQuery.of(context).size;
    double w(double v) => v * size.width / 390;
    double h(double v) => v * size.height / 844;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => pop(context),
              child: Icon(
                Icons.arrow_back_ios,
                color: theme.colorScheme.onSurface,
              ),
            ),
            Spacer(),
            Text(
              'Search Hospital',
              style: AppFontStyles.getSize24(
                fontWeight: FontWeight.w600,
                fontColor: theme.colorScheme.onSurface,
              ),
            ),
            Spacer()
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // SEARCH BAR
            TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchText = value.trim();
                });
              },
              style: TextStyle(
                fontSize: w(16),
                color: isDark ? Colors.white : AppColors.darkColor,
              ),
              decoration: InputDecoration(
                hintText: 'Search for a Hospital',
                hintStyle: TextStyle(
                  fontSize: w(14),
                  color: isDark
                      ? Colors.white54
                      : AppColors.darkColor,
                ),
                filled: true,
                fillColor:
                    isDark ? AppColors.darkCardSurface : const Color(0xFFF5F5F5),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: w(16),
                  vertical: h(12),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey, // white icon
                  size: w(22),
                ),
              ),
            ),

            const Gap(20),

            Row(
              children: [
                Text(
                  ' Search Results ',
                  style: TextStyle(
                    fontSize: w(18),
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const Spacer(),

                // 🔥 CLEAR BUTTON FUNCTIONAL
                TextButton(
                  onPressed: () {
                    searchController.clear();
                    setState(() {
                      searchText = "";
                    });
                  },
                  child: Text(
                    'Clear',
                    style: AppFontStyles.getSize14(
                      fontColor: AppColors.primaryBlueColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
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
                          height: h(100),
                          colorFilter: ColorFilter.mode(
                              AppColors.primaryBlueColor, BlendMode.srcIn),
                        ),
                        Gap(10),
                        Text(
                          textAlign: TextAlign.center,
                          "Please enter Hospital name \nto search",
                          style: AppFontStyles.getSize18(
                            fontWeight: FontWeight.w600,
                            fontColor: AppColors.primaryBlueColor,
                          ).copyWith(fontSize: w(18)),
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

                        final query = searchText.toLowerCase();
                        final filteredDocs = snapshot.data!.docs.where((doc) {
                          final data = doc.data() as Map<String, dynamic>;
                          final rawName = (data['name'] ?? '').toString();
                          final nameNormalized = rawName.toLowerCase();
                          return nameNormalized.contains(query);
                        }).toList();

                        if (filteredDocs.isEmpty) {
                          return const EmptySearch();
                        }

                        return ListView.separated(
                          separatorBuilder: (context, index) => const Gap(10),
                          itemCount: filteredDocs.length,
                          itemBuilder: (context, index) {
                            final doc = filteredDocs[index];
                            HospitalModel hospital = HospitalModel.fromJson(
                              doc.data() as Map<String, dynamic>,
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
              ColorFilter.mode(AppColors.primaryBlueColor, BlendMode.srcIn),
        ),
        const SizedBox(height: 10),
        Text(
          'No hospitals found',
          style: AppFontStyles.getSize18(
            fontColor: AppColors.primaryBlueColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
