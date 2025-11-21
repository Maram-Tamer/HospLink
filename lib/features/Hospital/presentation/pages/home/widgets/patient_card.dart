import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Patient/data/model/request-model.dart';

class PatientCardForHospitalHome extends StatelessWidget {
  const PatientCardForHospitalHome({
    super.key, required this.request,
  });
  final RequestModel request;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context: context, route: Routes.PatientDetails, extra:{'request':request,'isAccepted':false});
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.4),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(request.imageProfilePath??AppImages.PatientPhoto1),
              ),
              Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(request.name??'',
                      style: AppFontStyles.getSize16(
                          fontWeight: FontWeight.w600,
                          fontColor: Colors.black)),
                  Gap(5),
                  Text(request.address??'',
                      style:
                          AppFontStyles.getSize14(fontWeight: FontWeight.w500)),
                  Gap(5),
                  Text('Phone: ${request.phone??''}',
                      style:
                          AppFontStyles.getSize14(fontWeight: FontWeight.w500)),
                  Gap(5),
                  Text('Age: ${request.age??''}',
                      style:
                          AppFontStyles.getSize14(fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
