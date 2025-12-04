import 'package:flutter/material.dart';
import 'package:medigo/core/utils/fonts.dart';

// ignore: unused_element
class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;

  const _FilterChip({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected 
            ? theme.colorScheme.primary 
            : theme.colorScheme.surface, // background adapts to theme
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.06), // theme-aware shadow
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        label,
        style: AppFontStyles.getSize14(
          fontColor: selected 
              ? theme.colorScheme.onPrimary // text on primary
              : theme.colorScheme.onSurface, // text on surface
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
