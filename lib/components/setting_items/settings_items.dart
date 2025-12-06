import 'package:flutter/material.dart';

class SettingsItem extends StatefulWidget {
  final IconData icon;
  final Color? iconColor;
  final String title;
  final VoidCallback? onPressed;
  final bool hasSwitch;
  final bool? initialValue;
  final Function(bool)? onSwitchChanged;

  const SettingsItem({
    super.key,
    required this.icon,
    this.iconColor,
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
    final scheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    // Determine text color based on brightness
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;

    // Responsive scale (based on width)
    double scale = (size.width / 430).clamp(0.85, 1.2);

    return InkWell(
      onTap: widget.hasSwitch ? null : widget.onPressed,
      borderRadius: BorderRadius.circular(12 * scale),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10 * scale,
          horizontal: 14 * scale,
        ),
        child: Row(
          children: [
            // Leading Icon Box
            Container(
              padding: EdgeInsets.all(9 * scale),
              decoration: BoxDecoration(
                color: widget.iconColor ?? scheme.primary.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10 * scale),
              ),
              child: Icon(
                widget.icon,
                color: widget.iconColor != null
                    ? Colors.white
                    : scheme.primary,
                size: 20 * scale,
              ),
            ),

            SizedBox(width: 14 * scale),

            // Title
            Expanded(
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16 * scale,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
              ),
            ),

            // Trailing widget
            widget.hasSwitch
                ? Switch(
                    value: switchValue,
                    activeThumbColor: scheme.primary,
                    activeTrackColor: scheme.primary.withOpacity(0.4),
                    onChanged: (value) {
                      setState(() => switchValue = value);
                      widget.onSwitchChanged?.call(value);
                    },
                  )
                : Icon(
                    Icons.arrow_forward_ios,
                    size: 16 * scale,
                    color: scheme.outline,
                  ),
          ],
        ),
      ),
    );
  }
}
