import 'package:flutter/material.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class richText extends StatelessWidget {
  const richText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: 'You must accept the ',
            style: AppFontStyles.getSize14(
              fontColor: AppColors.darkGreyColor,
            ),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.zero,
                tapTargetSize:
                    MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                pushTo(
                  context: context,
                  route: Routes.Privacy,
                );
              },
              child: Text(
                'Privacy Policy',
                style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
