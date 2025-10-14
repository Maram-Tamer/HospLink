import 'package:flutter/material.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/utils/fonts.dart';

class PhotoHospital extends StatelessWidget {
  const PhotoHospital({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            AppImages.hospitalPhoto1,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 80, // ارتفاع المنطقة اللي فيها التدرّج
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.7), // غامق من تحت
                Colors.transparent, // شفاف لأعلى
              ],
            ),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
        ),
    
        Positioned(
          left: 20,
          bottom: 20,
          child: Text(
            'Hospital name',
            style: AppFontStyles.getSize24(
              fontWeight: FontWeight.w600,
              fontColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
