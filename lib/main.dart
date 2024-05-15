import 'package:agropro/pages/base/search/search.dart';
import 'package:agropro/utils/app_navbar.dart';

import 'package:agropro/utils/app_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oktoast/oktoast.dart';
import 'package:camera_web/camera_web.dart';

import 'data/services/navigation_service.dart';
import 'firebase_options.dart';
import 'locator.dart';
import 'pages/home/view/disease_diagnosis.dart';
import 'utils/main_nav.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // initialise firebase
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  //initialise local storage
  // await GetStorage.init();

  //setup different deployment environment

  //setup dependency injector
  //  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 1;
    return MaterialApp(
      // navigatorKey: getIt<NavigationService>().navigatorKey,
      // scaffoldMessengerKey: getIt<NavigationService>().snackBarKey,
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(primarySwatch: Colors.blue),

      // home:  Search(),
      home:  MainNva(),
    );
  }
}
