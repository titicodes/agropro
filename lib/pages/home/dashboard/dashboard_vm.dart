import 'package:agropro/pages/base/search/search.dart';
import 'package:agropro/pages/home/widgets/profiles.dart';
import 'package:agropro/pages/market/market_plaes.dart';
import 'package:agropro/pages/market/payment_screen.dart';
import 'package:agropro/pages/market/place_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../base/forum/forum_screen.dart';
import '../../base/search/search_results.dart';

class BottomNavViewModel extends GetxController {
  static BottomNavViewModel get find => Get.find();
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
    SearchResults(),
    Profiles(),
    MarketPlacesView(),
    PaymentScreen(), // Add your Payment screen here
    //PlaceOrderScreen(),
    Center()
  ];

  //Pops the app back
  static Future<void> pop({bool? animated}) async {
    await SystemChannels.platform
        .invokeMethod<void>('SystemNavigator.pop', animated);
  }
}
