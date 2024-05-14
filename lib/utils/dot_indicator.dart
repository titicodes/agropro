
import 'package:agropro/utils/app_color.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int currentIndex;
  final int dotCount;
  final Color dotColor;
  final Color activeDotColor;

  DotIndicator({
    required this.currentIndex,
    required this.dotCount,
    this.dotColor = Colors.transparent,
    this.activeDotColor = AppColor.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(dotCount, (index) {
        return Container(
          width: 10,
          height: 10,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.blue),
            shape: BoxShape.circle,
            color: currentIndex == index ? activeDotColor : dotColor,
          ),
        );
      }),
    );
  }
}
