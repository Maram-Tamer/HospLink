import 'package:flutter/material.dart';
import 'package:medigo/components/setting_items/settings_items.dart';

class SettingsGroup extends StatelessWidget {
  final List<SettingsItem> items;

  const SettingsGroup({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    final size = MediaQuery.of(context).size;
    final isDark = theme.brightness == Brightness.dark;

    // Responsive scaling based on screen width
    double scale = (size.width / 430).clamp(0.85, 1.15);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 6 * scale, horizontal: 4 * scale),
      decoration: BoxDecoration(
        color: scheme.surface, // Material surface color
        borderRadius: BorderRadius.circular(14 * scale),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: scheme.shadow.withOpacity(0.12),
              blurRadius: 12 * scale,
              spreadRadius: 1 * scale,
              offset: Offset(0, 3 * scale),
            ),
          if (isDark)
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 16 * scale,
              offset: Offset(0, 4 * scale),
            ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14 * scale),
        child: Column(
          children: List.generate(items.length, (index) {
            final item = items[index];
            return Column(
              children: [
                item,
                if (index != items.length - 1)
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: scheme.surfaceContainerHighest.withOpacity(0.4),
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
