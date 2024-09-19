import 'package:agropro/pages/base/search/search_vm.dart';
import 'package:agropro/pages/home/dashboard/dashboard.dart';
import 'package:agropro/pages/home/dashboard/dashboard_vm.dart';
import 'package:agropro/pages/market/controller/cart_controller.dart';
import 'package:agropro/pages/market/controller/marker_controller.dart';
import 'package:agropro/utils/app_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initPreAppServices();

  // initialise firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //initialise local storage
  await GetStorage.init();

  //setup different deployment environment

  //setup dependency injector
  setupLocator();

  runApp(const MyApp());
}

Future<void> _initPreAppServices() async {
  Get.put(BottomNavViewModel(), permanent: true);
  Get.put(SearchViewModel(), permanent: true);
  Get.put(MarketplaceController(), permanent: true);
  Get.put(CartController(), permanent: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      child: MaterialApp(
        // navigatorKey: getIt<NavigationService>().navigatorKey,
        // scaffoldMessengerKey: getIt<NavigationService>().snackBarKey,
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: ThemeData(primarySwatch: Colors.blue),

        home: BottomNav(selectedIndex: 0),
      ),
    );
  }
}
