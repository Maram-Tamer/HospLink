import 'package:flutter/material.dart';
import 'package:medigo/core/utils/fonts.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({
    super.key, required this.image, required this.name,
  });
final String image;
final String name;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image,
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
                Colors.black.withValues(alpha: 0.7), // غامق من تحت
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
          bottom: 10,
          child: Text(
            name,
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
