import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class ChoochAllHighpatient extends StatefulWidget {
  ChoochAllHighpatient({super.key, required this.isSelected});

  bool isSelected;

  @override
  State<ChoochAllHighpatient> createState() => _ChoochAllHighpatientState();
}

class _ChoochAllHighpatientState extends State<ChoochAllHighpatient> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              widget.isSelected = true;
            });
          },
          child: Container(
            width: 70,
            height: 30,
            decoration: BoxDecoration(
              color: widget.isSelected ? AppColors.blue2 : AppColors.blueLight,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                'All',
                style: AppFontStyles.getSize14(
                  fontWeight: FontWeight.w500,
                  fontColor: widget.isSelected
                      ? AppColors.whiteColor
                      : AppColors.primaryGreenColor,
                ),
              ),
            ),
          ),
        ),
        Gap(20),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.isSelected = false;
            });
          },
          child: Container(
            width: 70,
            height: 30,
            decoration: BoxDecoration(
              color: widget.isSelected ? AppColors.blueLight : AppColors.red,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                'High',
                style: AppFontStyles.getSize14(
                  fontWeight: FontWeight.w500,
                  fontColor: widget.isSelected
                      ? AppColors.red
                      : AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
