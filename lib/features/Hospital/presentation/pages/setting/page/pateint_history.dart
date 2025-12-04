import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/services/firebase/FirebaseServices.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Patient/data/model/history_model.dart';

class PatientHistoryScrren extends StatefulWidget {
  const PatientHistoryScrren({super.key});

  @override
  State<PatientHistoryScrren> createState() => _PatientHistoryScrrenState();
}

class _PatientHistoryScrrenState extends State<PatientHistoryScrren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Hospital History', leading: true),
      body: FutureBuilder(
        future: FirebaseServices.getHistory(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          /// تحويل الداتا إلى ليست من HistoryModel
          List<HistoryModel> historyList = snapshot.data!.docs.map((doc) {
            return HistoryModel.fromJson(doc.data() as Map<String, dynamic>);
          }).toList();

          return Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return HistoryCard(historyModel: historyList[index]);
              },
              separatorBuilder: (context, index) => const Gap(10),
              itemCount: historyList.length,
            ),
          );
        },
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key, required this.historyModel});
  final HistoryModel historyModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.geyTextform,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                AppImages.PatientPhoto1,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(3),
                Text(historyModel.namePatient ?? "",
                    style: AppFontStyles.getSize18()),
                const Gap(5),
                Text(
                  historyModel.phonePatient ?? "",
                  style: AppFontStyles.getSize16(),
                ),
                const Gap(8),
                Row(
                  children: [
                    Icon(Icons.star, color: AppColors.yellow, size: 20),
                    const Gap(8),
                    Text(
                      "4.8",
                      style: AppFontStyles.getSize14(
                        fontColor: AppColors.darkColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Gap(20),
                    Icon(Icons.date_range, color: AppColors.blue2, size: 20),
                    const Gap(8),
                    Text(
                      historyModel.date ?? "",
                      style: AppFontStyles.getSize14(
                        fontColor: AppColors.darkColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
