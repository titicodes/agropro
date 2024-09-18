import 'package:agropro/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../utils/widget_extensions.dart';
import 'bottom_bar.dart';
import 'dashboard_vm.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key, required this.selectedIndex});
  final int selectedIndex;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

final ValueNotifier<int> pageIndex = ValueNotifier(0);

class _BottomNavState extends State<BottomNav> {
  @override
  void initState() {
    pageIndex.value = widget.selectedIndex;
    super.initState();
  }

  void _onNavigationItem(index) {
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavViewModel>(
      builder: (model) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.camera),
                fit: BoxFit
                    .cover, // You can use different BoxFit values based on your requirement
              ),
            ),
            height: height(context) / 0.4.sp,
            child: ValueListenableBuilder(
                valueListenable: pageIndex,
                builder: (BuildContext context, int value, _) {
                  return model.children[value];
                }),
          ),
          bottomNavigationBar: BottomNavBar(
            onItemSelected: _onNavigationItem,
            selectedIndex: pageIndex.value,
          ),
        ),
      ),
    );
  }
}
