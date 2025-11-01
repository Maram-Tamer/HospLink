// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

// ignore: must_be_immutable
class MainTextFormField extends StatefulWidget {
  MainTextFormField(
      {super.key,
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
      this.inputFormat});
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

  @override
  State<MainTextFormField> createState() => _MainTextFormFieldState();
}

class _MainTextFormFieldState extends State<MainTextFormField> {
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.ispassword && isObsecure,
      validator: widget.validator,
      controller: widget.controller,
      maxLines: widget.maxTextLines,
      style: AppFontStyles.getSize18(),
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormat,
      decoration: InputDecoration(
        label: Text(
          widget.label ?? "",
          style: AppFontStyles.getSize14(
            fontColor: widget.textColor ?? AppColors.greyColor,
          ),
        ),
        filled: true,
        fillColor: widget.colorFill ?? AppColors.geyTextform,
        suffixIcon: widget.ispassword
            ? Transform.flip(
                flipY: true,
                child: IconButton(
                  icon: Icon(
                    isObsecure ? Icons.visibility : Icons.visibility_off,
                    color: Color(0xffB1B5C4),
                  ),
                  onPressed: () {
                    setState(() {
                      isObsecure = !isObsecure;
                    });
                  },
                ),
              )
            : null,
        prefixIconConstraints: BoxConstraints(maxHeight: 35, maxWidth: 35),
        prefixIcon: (widget.prefixIcon != null)
            ? Padding(
                padding: const EdgeInsets.only(left: 8, right: 5),
                child: SvgPicture.asset(
                  widget.prefixIcon ?? '',
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryGreenColor,
                    BlendMode.srcIn,
                  ),
                ),
              )
            : null,
        hint: Text(
          widget.textFormFieldText ?? "",
          style: AppFontStyles.getSize18(fontColor: AppColors.greyColor),
        ),
      ),
    );
  }
}
