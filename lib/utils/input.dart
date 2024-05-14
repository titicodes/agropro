import 'package:agropro/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double height;
  final double borderWidth;
  final double borderRadius;
  final Color borderColor;
  final double inputTextSize;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;

  const AppInputField({
    Key? key,
    required this.controller,
     required this.hintText,
    this.height = 45,
    this.borderWidth = 1,
    this.borderRadius = 8,
    this.borderColor = AppColor.green,
    this.inputTextSize = 12,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: TextField(
        controller: controller,
        style: GoogleFonts.montserrat(fontSize: inputTextSize),
        enabled: enabled,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          border: InputBorder.none,
          prefixIcon: prefixIcon, 
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
