import 'package:flutter/material.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/components/setting%20items/settings_items.dart';

class SettingsGroup extends StatelessWidget {
  final List<SettingsItem> items;

  const SettingsGroup({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyColor.withValues(alpha: .4),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          final item = items[index];
          return Column(
            children: [
              item,
              if (index != items.length - 1)
                const Divider(height: 1, color: AppColors.whiteColor),
            ],
          );
        }),
      ),
    );
  }
}
