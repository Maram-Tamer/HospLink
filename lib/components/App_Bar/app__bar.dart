import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class App_Bar extends StatelessWidget implements PreferredSizeWidget {
  App_Bar({
    super.key,
    this.title = '',
    this.leading = false,
    this.action = false,
    this.icon,
    this.onPressAction,
    this.color = AppColors.blueLight,
    this.colorIconBack = AppColors.darkColor,
  });
  final String title;
  final Color color;
  final Color colorIconBack;

  final bool leading;
  final bool action;
  final String? icon;
  void Function()? onPressAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: color,
      title: Text(title, style: AppFontStyles.getSize24()),
      centerTitle: true,
      leadingWidth: 75,
      leading: leading
          ? Padding(
              padding: const EdgeInsets.only(left: 12),
              child: //SvgPicture.asset(App_Assets.backArrowSVG)
                  IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: colorIconBack),
              ),
            )
          : null,
      actions: [
        action
            ? IconButton(
                onPressed: onPressAction,
                icon: SvgPicture.asset(
                  icon!,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryGreenColor,
                    BlendMode.srcIn,
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
