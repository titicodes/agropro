import 'package:agropro/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInputField extends StatelessWidget {
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final TextEditingController? controller;
  

  AppInputField(
      {this.obscureText = false,
      this.prefixIcon,
      this.suffixIcon,
      this.hintText,
      this.controller});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size.width
    return Container(height: 45, 
      decoration: BoxDecoration(
        color: AppColor.white,
        border: Border.all(
          color: AppColor.green,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
         border: OutlineInputBorder(borderSide: BorderSide.none),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintText: hintText),
        ),
      ),
    );
  }
}
