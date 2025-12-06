import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medigo/core/utils/fonts.dart';

// ignore: must_be_immutable
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  MainAppBar({
    super.key,
    this.title = '',
    this.leading = false,
    this.action = false,
    this.icon,
    this.onPressAction,
    // Note: The colors below will be overridden by theme colors inside build()
    this.color, 
    this.colorIconBack,
  });
  
  final String title;
  // Make colors nullable so we can use theme defaults if not provided
  final Color? color;
  final Color? colorIconBack;

  final bool leading;
  final bool action;
  final String? icon;
  void Function()? onPressAction;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // --- Theme-Responsive Color Assignment ---
    
    // 1. AppBar Background Color
    // Default to the provided color or the theme's background color
    final appBarColor = color ?? Colors.transparent;

    // 2. Back Icon Color
    // Default to the provided color or the theme's primary text color (onBackground)
    final backIconColor = colorIconBack ?? colorScheme.onSurface;

    // 3. Title Text Style (Use theme's headline style and primary text color)
    final titleStyle = textTheme.headlineSmall?.copyWith(
      color: colorScheme.onSecondary,// Use primary text color
      fontWeight: FontWeight.bold,
    ) ?? AppFontStyles.getSize24().copyWith(color: colorScheme.onPrimary);
    
    // 4. Action Icon Color
    // Default to the theme's primary accent color
    final actionIconColor = colorScheme.primary;


    return AppBar(
      scrolledUnderElevation: 0,
      // Use colorScheme.background for transparent surfaces to ensure theme consistency
      surfaceTintColor: colorScheme.surface, 
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: appBarColor, // Theme-responsive background
      
      // Title Style
      title: Text(title, style: titleStyle.copyWith(fontSize: 24,color:colorScheme.onSurface )),
      centerTitle: true,
      leadingWidth: 75,
      
      // Leading (Back Button)
      leading: leading
          ? Padding(
              padding: const EdgeInsets.only(left: 12),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                // Use theme-responsive color
                icon: Icon(Icons.arrow_back_ios, color: backIconColor), 
              ),
            )
          : null,
          
      // Actions
      actions: [
        action
            ? IconButton(
                onPressed: onPressAction,
                icon: SvgPicture.asset(
                  icon!,
                  height: 24,
                  width: 24,
                  // Use theme-responsive color for the action icon
                  colorFilter: ColorFilter.mode(
                    actionIconColor,
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