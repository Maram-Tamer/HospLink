import 'dart:ui';

import 'package:flutter/material.dart';

class SimpleTopCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 60);

    path.quadraticBezierTo(size.width / 2, 0, size.width, 60);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
class DeepBottomCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    
    // منحنى أعمق - زود الرقم الثاني
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 40,  // ⭐ كل ما زودت الرقم، المنحنى يبقى أعمق
      size.width,
      size.height - 60
    );
    
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/* 
📖 شرح quadraticBezierTo:

path.quadraticBezierTo(x1, y1, x2, y2);

x1, y1 = نقطة التحكم (Control Point) - بتحدد عمق وشكل المنحنى
x2, y2 = نقطة النهاية (End Point)

💡 نصائح:
- كل ما زودت y1، المنحنى يبقى أعمق
- size.width / 2 = نص العرض (المنتصف)
- size.height = الارتفاع الكامل

🎨 للاستخدام:
ClipPath(
  clipper: SimpleBottomCurve(), // أو أي clipper تاني
  child: Container(...),
)
*/