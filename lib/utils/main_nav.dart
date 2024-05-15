import 'package:agropro/pages/home/view/new_diagnose_view.dart';
import 'package:flutter/material.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';

class MainNva extends StatelessWidget {
  MainNva({super.key});
  final _pageControlller = PageController();

  @override
  void dispose() {
    _pageControlller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageControlller,
        children: const [SizedBox(), SizedBox(), SizedBox(), NewDiagnoseView(), SizedBox()],
      ),
      extendBody: true,
      bottomNavigationBar: RollingBottomBar(
        color: Colors.white,
        controller: _pageControlller,
        flat: true,
        useActiveColorByDefault: false,
        items: const [
          RollingBottomBarItem(Icons.people,
              label: 'Forum', activeColor: Colors.green),
          RollingBottomBarItem(Icons.agriculture_rounded,
              label: 'My Farm', activeColor: Colors.green),
          RollingBottomBarItem(Icons.camera,
              label: 'Identity', activeColor: Colors.green),
          RollingBottomBarItem(Icons.medical_information,
              label: 'Diagnosis', activeColor: Colors.green),
          RollingBottomBarItem(Icons.person,
              label: 'Profile', activeColor: Colors.green),
        ],
        enableIconRotation: true,
        onTap: (index) {
          _pageControlller.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
          );
        },
      ),
    );
  }
}
