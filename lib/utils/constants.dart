import 'package:agropro/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/services/navigation_service.dart';
import '../locator.dart';

final NavigationService navigationService = getIt<NavigationService>();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class AppBottomSheet {
  static void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        isScrollControlled: true,
        isDismissible: true,
        enableDrag: true,
        context: context,
        builder: (context) => bottomSheetView);
  }
}

class AppText extends StatelessWidget {
  final String? text;
  final bool isBold;
  final double size;
  final String fontFamily;
  final Color? color;
  final FontWeight weight;
  final TextAlign align;

  const AppText(
    this.text, {
    Key? key,
    this.isBold = false,
    this.size = 14,
    this.fontFamily = 'Montserrat',
    this.color,
    this.weight = FontWeight.normal,
    this.align = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '', // If text is null, use an empty string
      textAlign: align,
      style: GoogleFonts.montserrat(fontSize : size, fontWeight: isBold ? FontWeight.bold : weight, color: color)
    );
  }
}

Widget customProgressIndicator() {
  return SpinKitCircle(
    color: AppColor.green,
    size: 30.0.sp,
  );
}
