import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medigo/core/utils/fonts.dart';

class StarRating extends StatelessWidget {
  final int rating;
  final ValueChanged<int> onRatingChanged;

  const StarRating({
    super.key,
    required this.rating,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () => onRatingChanged(index + 1),
              child: Icon(
                Icons.star,
                color: index < rating ? Colors.amber : Colors.grey.shade400,
                size: 30,
              ),
            );
          }),
        ),
        Gap(10),
        Text("$rating", style: AppFontStyles.getSize14()),
      ],
    );
  }
}
