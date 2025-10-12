import 'package:flutter/material.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class SettingsItem extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final VoidCallback? onPressed;
  final bool hasSwitch;
  final bool? initialValue;
  final Function(bool)? onSwitchChanged;

  const SettingsItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    this.onPressed,
    this.hasSwitch = false,
    this.initialValue,
    this.onSwitchChanged,
  });

  @override
  State<SettingsItem> createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  late bool switchValue;

  @override
  void initState() {
    super.initState();
    switchValue = widget.initialValue ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onPressed,
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: widget.iconColor.withValues(alpha: .15),
        child: Icon(widget.icon, color: widget.iconColor),
      ),
      title: Text(
        widget.title,
        style: AppFontStyles.getSize16(
          fontColor: AppColors.darkColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: widget.hasSwitch
          ? Switch(
              activeTrackColor: AppColors.primaryGreenColor,
              value: switchValue,
              onChanged: (value) {
                setState(() => switchValue = value);
                if (widget.onSwitchChanged != null) {
                  widget.onSwitchChanged!(value);
                }
              },
            )
          : const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
    );
  }
}