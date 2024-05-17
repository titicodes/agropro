import 'package:agropro/pages/base/search/plant_identified2.dart';
import 'package:agropro/utils/app_text.dart';
import 'package:agropro/utils/main_nav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // navigatorKey: getIt<NavigationService>().navigatorKey,
      // scaffoldMessengerKey: getIt<NavigationService>().snackBarKey,
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(primarySwatch: Colors.blue),

      home: PlantIdentified2(),
    );
  }
}
