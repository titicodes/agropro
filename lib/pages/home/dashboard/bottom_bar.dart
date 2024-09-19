import 'package:agropro/utils/app_color.dart';
import 'package:agropro/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'bar_item.dart';
import 'dashboard_vm.dart';

/* The Custom Navigation Bars */
// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    super.key,
    required this.onItemSelected,
    required this.selectedIndex,
  });

  //handles the state changes
  final ValueChanged<int> onItemSelected;

  int selectedIndex;

  @override
  State<BottomNavBar> createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  late ScrollController scrollController;
  //handles selections between the screens
  void handleItemSelected(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  double barIconHeight = 14.sp;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavViewModel>(
        builder: (model) => Container(
              height: 80.sp,
              padding: EdgeInsets.only(right: 8.sp, left: 8.sp, bottom: 1.sp),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(26.r)),
                  color: AppColor.background.withOpacity(.5)),
              child: Row(
                children: [
                  Expanded(
                    child: FittedBox(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NavigationBarItem(
                              label: "Forum",
                              icon: Image.asset(AppImages.forum,
                                  height: widget.selectedIndex == 0
                                      ? 16.sp
                                      : barIconHeight,
                                  color: widget.selectedIndex == 0
                                      ? AppColor.green
                                      : AppColor.grey),
                              isSelected: (widget.selectedIndex == 0),
                              index: 0,
                              onTap: handleItemSelected,
                            ),
                            NavigationBarItem(
                              label: "My Farm",
                              icon: Image.asset(AppImages.myFarm,
                                  height: widget.selectedIndex == 1
                                      ? 16.sp
                                      : barIconHeight,
                                  color: widget.selectedIndex == 1
                                      ? AppColor.green
                                      : AppColor.grey),
                              isSelected: (widget.selectedIndex == 1),
                              index: 1,
                              onTap: handleItemSelected,
                            ),
                            NavigationBarItem(
                              label: "Identify",
                              icon: Image.asset(AppImages.identify,
                                  height: widget.selectedIndex == 2
                                      ? 16.sp
                                      : barIconHeight,
                                  color: widget.selectedIndex == 2
                                      ? AppColor.green
                                      : AppColor.grey),
                              isSelected: (widget.selectedIndex == 2),
                              index: 2,
                              onTap: handleItemSelected,
                            ),
                            NavigationBarItem(
                              label: "Diagnose",
                              icon: Image.asset(AppImages.diagnose,
                                  height: widget.selectedIndex == 3
                                      ? 16.sp
                                      : barIconHeight,
                                  color: widget.selectedIndex == 3
                                      ? AppColor.green
                                      : AppColor.grey),
                              isSelected: (widget.selectedIndex == 3),
                              index: 3,
                              onTap: handleItemSelected,
                            ),
                            NavigationBarItem(
                              label: "Profile",
                              icon: Image.asset(AppImages.profile,
                                  height: widget.selectedIndex == 4
                                      ? 16.sp
                                      : barIconHeight,
                                  color: widget.selectedIndex == 4
                                      ? AppColor.green
                                      : AppColor.grey),
                              isSelected: (widget.selectedIndex == 4),
                              index: 4,
                              onTap: handleItemSelected,
                            ),
                            NavigationBarItem(
                              label: "Market",
                              icon: Image.asset(AppImages.myFarm,
                                  height: widget.selectedIndex == 5
                                      ? 16.sp
                                      : barIconHeight,
                                  color: widget.selectedIndex == 5
                                      ? AppColor.green
                                      : AppColor.grey),
                              isSelected: (widget.selectedIndex == 5),
                              index: 5,
                              onTap: handleItemSelected,
                            ),
                            NavigationBarItem(
                              label: "Payment",
                              icon: Image.asset(AppImages.camera,
                                  height: widget.selectedIndex == 6
                                      ? 16.sp
                                      : barIconHeight,
                                  color: widget.selectedIndex == 6
                                      ? AppColor.green
                                      : AppColor.grey),
                              isSelected: (widget.selectedIndex == 6),
                              index: 6,
                              onTap: handleItemSelected,
                            ),
                            NavigationBarItem(
                              label: "Orders",
                              icon: Image.asset(AppImages.camera,
                                  height: widget.selectedIndex == 7
                                      ? 16.sp
                                      : barIconHeight,
                                  color: widget.selectedIndex == 7
                                      ? AppColor.green
                                      : AppColor.grey),
                              isSelected: (widget.selectedIndex == 7),
                              index: 7,
                              onTap: handleItemSelected,
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ));
  }
}
