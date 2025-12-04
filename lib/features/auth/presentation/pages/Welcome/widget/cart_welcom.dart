import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/core/routes/navigation.dart';

class CartWelcom extends StatelessWidget {
  const CartWelcom({
    super.key,
    required this.image,
    required this.routeLogin,
    required this.routeRegister,
  });

  final String image;
  final String routeLogin;
  final String routeRegister;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final scale = (size.width / 430).clamp(0.85, 1.2);
    final buttonWidth = 350 * scale;

    return Column(
      children: [
        SizedBox(
          width: 50 * scale,
          height: 50 * scale,
          child: Image.asset(image),
        ),
        Gap(20 * scale),
        MainButton(
          width: buttonWidth,
          buttonText: 'Login',
          onPressed: () => pushTo(context: context, route: routeLogin),
          textColor: theme.colorScheme.onPrimary,
          buttomColor: theme.colorScheme.primary,
        ),
        Gap(20 * scale),
        MainButton(
          width: buttonWidth,
          buttonText: 'Sign Up',
          onPressed: () => pushTo(context: context, route: routeRegister),
          textColor: theme.colorScheme.primary,
          buttomColor: theme.colorScheme.background,
        
        ),
      ],
    );
  }
}
