import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medigo/core/utils/fonts.dart';

class ItemPatientAccepted extends StatelessWidget {
  const ItemPatientAccepted({
    super.key,
    required this.icon,
    required this.title,
    this.maxLine,
  });

  final String icon;
  final String title;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = theme.textTheme.bodySmall?.color ?? Colors.grey;
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;

    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min, // keeps the row compact
        children: [
          SvgPicture.asset(
            icon,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          const Gap(5),
          Flexible(
            child: Text(
              title,
              style: AppFontStyles.getSize12(fontColor: textColor),
              maxLines: maxLine ?? 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
