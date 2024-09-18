import 'package:agropro/pages/base/search/search.dart';
import 'package:agropro/pages/home/widgets/profiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../base/forum/forum_screen.dart';
import '../../base/search/plant_identified2.dart';
import '../../base/search/search_results.dart';
import '../diagnose_view.dart';


class BottomNavViewModel extends GetxController {
  bool? isPremium;
  bool isButtonPressed = false;
  // UserResponse? userResponse;

  // int selectedPage = 0;
  // int limit=20;
  // int page=1;

  // void onNavigationItem(index) {
  //   selectedPage = index;
  //   notifyListeners();
  // }

  List<Widget> children = [
    ForumScreen(),
    SearchResults(),
    Search(),
    DiseaseDiagnosView(),
    Profiles(),

  ];

  //Pops the app back
  static Future<void> pop({bool? animated}) async {
    await SystemChannels.platform
        .invokeMethod<void>('SystemNavigator.pop', animated);
  }
}
