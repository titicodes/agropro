import 'package:agropro/utils/app_color.dart';
import 'package:agropro/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../utils/constants.dart';
import 'dashboard_vm.dart';

// ignore: must_be_immutable
class NavigationBarItem extends StatelessWidget {
  NavigationBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
    this.isSelected = false,
    required this.onTap,
  });

  final Widget icon;
  final String label;
  final int index;
  final bool isSelected;
  ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavViewModel>(
        builder: (model) => InkWell(
          onTap: () {
            onTap(index);
          },
          borderRadius: BorderRadius.circular(40
              .sp), // Half the height of the container for a circular shape
          child: Container(
            margin: EdgeInsets.only(left: 8.sp, right: 8.sp),
            height: 30.sp,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                label == "" ? Gap(0.sp) : Gap(3.sp),
                label == ""
                    ? 0.0.sp.sbH
                    : AppText(
                  label,
                  size: 6.sp,
                  color: isSelected
                      ? AppColor.green
                      : AppColor.grey,
                )
              ],
            ),
          ),
        ));
  }
}
