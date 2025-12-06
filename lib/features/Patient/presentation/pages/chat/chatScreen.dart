import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/utils/fonts.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // COLORS FROM THEME
    final bgColor = theme.colorScheme.surface;
    final topBarColor = theme.colorScheme.primary;
    final bubbleMe = theme.colorScheme.primary;
    final bubbleOther = theme.colorScheme.surface;
    final textMe = theme.colorScheme.onPrimary;
    final textOther = theme.colorScheme.onSurface;
    final iconColor = theme.colorScheme.onPrimary;
    final inputBorder = theme.dividerColor;
    final inputBg = theme.colorScheme.surface;
    final greyText = theme.hintColor;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            // ---------------- TOP BAR ----------------
            Container(
              height: 70,
              color: topBarColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // LEFT SECTION
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          color: iconColor,
                        ),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: theme.colorScheme.surface,
                        child: SvgPicture.asset(
                          AppIcons.profileSVG,
                          colorFilter: ColorFilter.mode(
                            theme.colorScheme.onSurface,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      Gap(10),
                      Text(
                        'Hospital Name',
                        style: AppFontStyles.getSize18(
                          fontColor: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),

                  // RIGHT SECTION
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.list, color: iconColor),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.call, color: iconColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Gap(30),

            // ---------------- ME (RIGHT BUBBLE) ----------------
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth:
                              MediaQuery.of(context).size.width / 1.5,
                        ),
                        decoration: BoxDecoration(
                          color: bubbleMe,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Helloooooooooooooooooooooooooooo!',
                          style: AppFontStyles.getSize14(
                            fontColor: textMe,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Gap(20),

            // ---------------- OTHER (LEFT BUBBLE) ----------------
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth:
                              MediaQuery.of(context).size.width / 1.5,
                        ),
                        decoration: BoxDecoration(
                          color: bubbleOther,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '*****************************************************************************************',
                          style: AppFontStyles.getSize14(
                            fontColor: textOther,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ---------------- INPUT SECTION ----------------
      bottomNavigationBar: Container(
        height: 70,
        color: bgColor,
        child: Row(
          children: [
            Gap(15),

            // SEND ICON
            CircleAvatar(
              backgroundColor: topBarColor,
              radius: 20,
              child: SvgPicture.asset(
                AppIcons.sendSVG,
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.onPrimary,
                  BlendMode.srcIn,
                ),
              ),
            ),

            Gap(10),

            // INPUT FIELD
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: inputBg,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: inputBorder),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // LEFT ICONS
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: greyText,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.file_present,
                            color: greyText,
                          ),
                        ),
                      ],
                    ),

                    // PLACEHOLDER + EMOJI
                    Row(
                      children: [
                        Text(
                          'Write a message...',
                          style: AppFontStyles.getSize18(
                            fontColor: greyText,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.emoji_emotions_outlined,
                            color: greyText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
