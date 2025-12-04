// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

// ignore: must_be_immutable
class MainTextFormField extends StatefulWidget {
  MainTextFormField({
    super.key,
    this.controller,
    this.textFormFieldText,
    this.maxTextLines = 1,
    this.validator,
    required this.ispassword,
    this.colorFill,
    this.label,
    this.prefixIcon,
    this.sufixIcon,
    this.textColor,
    this.keyboardType,
    this.inputFormat,
    this.fillColor, // manual override
  });

  bool ispassword = false;
  String? Function(String?)? validator;
  int maxTextLines;
  String? textFormFieldText;
  final TextEditingController? controller;
  final Color? colorFill;
  final String? label;
  final String? prefixIcon;
  final String? sufixIcon;
  final Color? textColor;
  final TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormat;
  final Color? fillColor;

  @override
  State<MainTextFormField> createState() => _MainTextFormFieldState();
}

class _MainTextFormFieldState extends State<MainTextFormField> {
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // -----------------------------------
    // THEME RESPONSIVE FILL COLOR
    // Priority: widget.fillColor → theme → default
    // -----------------------------------
    final Color finalFillColor = widget.fillColor ??
        (isDark ? AppColors.darkCardSurface : AppColors.geyTextform);

    double w(double value) => value * size.width / 390;
    double h(double value) => value * size.height / 844;

    return TextFormField(
      obscureText: widget.ispassword && isObsecure,
      validator: widget.validator,
      controller: widget.controller,
      maxLines: widget.maxTextLines,
      style: AppFontStyles.getSize18().copyWith(fontSize: w(18)),
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormat,
      decoration: InputDecoration(
        label: Text(
          widget.label ?? "",
          style: AppFontStyles.getSize14(
            fontColor: widget.textColor ??
                (isDark ? AppColors.primaryDarkText : AppColors.greyColor),
          ).copyWith(fontSize: w(14)),
        ),

        // -----------------------
        // THEME RESPONSIVE FILL
        // -----------------------
        filled: true,
        fillColor: finalFillColor,

        // ----------------------
        // Password Visibility Icon
        // ----------------------
        suffixIcon: widget.ispassword
            ? Transform.flip(
                flipY: true,
                child: IconButton(
                  icon: Icon(
                    isObsecure ? Icons.visibility : Icons.visibility_off,
                    size: w(22),
                    color: const Color(0xffB1B5C4),
                  ),
                  onPressed: () {
                    setState(() {
                      isObsecure = !isObsecure;
                    });
                  },
                ),
              )
            : null,

        // ----------------------
        // Prefix Icon
        // ----------------------
        prefixIconConstraints:
            BoxConstraints(maxHeight: h(35), maxWidth: w(35)),
        prefixIcon: (widget.prefixIcon != null)
            ? Padding(
                padding: EdgeInsets.only(left: w(8), right: w(5)),
                child: SvgPicture.asset(
                  widget.prefixIcon ?? '',
                  width: w(22),
                  height: h(22),
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryBlueColor,
                    BlendMode.srcIn,
                  ),
                ),
              )
            : null,

        // ----------------------
        // Responsive Hint Text
        // ----------------------
        hint: Text(
          widget.textFormFieldText ?? "",
          style: AppFontStyles.getSize18(
            fontColor: isDark
                ? AppColors.secondaryDarkText
                : AppColors.greyColor,
          ).copyWith(fontSize: w(18)),
        ),
      ),
    );
  }
}
