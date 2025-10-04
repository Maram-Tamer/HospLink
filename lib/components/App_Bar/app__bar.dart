import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class App_Bar extends StatelessWidget implements PreferredSizeWidget {
  const App_Bar({
    super.key,
    this.title = '',
    this.leading = false,
    //this.action = false,
    //this.icon,
    // this.onPress,
  });
  final String title;
  final bool leading;
  //final bool action;
  //final String? icon;
  //void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.AppBarColor,
      title: Text(title, style: AppFontStyles.getSize24()),

      centerTitle: true,
      leadingWidth: 75,
      leading:
          leading
              ? Padding(
                padding: const EdgeInsets.only(left: 12),
                child: //SvgPicture.asset(App_Assets.backArrowSVG)
                    IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(AppIcons.back),
                ),
              )
              : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
