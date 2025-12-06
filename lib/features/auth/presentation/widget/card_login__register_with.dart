import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/navigation.dart';

class CardLoginRegisterWith extends StatelessWidget {
  const CardLoginRegisterWith({
    super.key,
    required this.widget,
    required this.title,
    required this.subtitle,
    required this.route,
  });

  final String title;
  final String subtitle;
  final String route;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Divider with "Or login with"
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    endIndent: 15,
                    indent: 70,
                    color: theme.colorScheme.onSurface.withOpacity(0.3),
                  ),
                ),
                Center(
                  child: Text(
                    'Or login with',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    endIndent: 70,
                    indent: 15,
                    color: theme.colorScheme.onSurface.withOpacity(0.3),
                  ),
                ),
              ],
            ),
            Gap(10),
            // Social login buttons
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: theme.colorScheme.surface,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: theme.colorScheme.surface,
                    child: Image.asset(AppImages.facebook),
                  ),
                ),
                Gap(20),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: theme.colorScheme.surface,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: theme.colorScheme.surface,
                    child: Image.asset(AppImages.google),
                  ),
                ),
                Gap(20),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: theme.colorScheme.surface,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: theme.colorScheme.surface,
                    child: Image.asset(AppImages.apple),
                  ),
                ),
              ],
            ),
            Gap(10),
            // Login / Register navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(fontSize: 17),
                ),
                GestureDetector(
                  onTap: () {
                    pushWithReplacment(context: context, route: route);
                  },
                  child: Text(
                    subtitle,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
