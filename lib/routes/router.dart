
import 'package:agropro/pages/base/search/plant_identification.dart';
import 'package:agropro/pages/base/search/search.dart';
import 'package:agropro/pages/base/search/search_results.dart';
import 'package:agropro/pages/home/dashboard/dashboard.dart';
import 'package:agropro/pages/home/diagnose_view.dart';
import 'package:flutter/material.dart';

import '../utils/main_nav.dart';
import 'routes.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => BottomNav(selectedIndex: 0));
      case seearchRoute:
        return MaterialPageRoute(builder: (_) => Search());
      case searchResultRoute:
        return MaterialPageRoute(builder: (_) => SearchResults());
      case diagnosisRoute:
        return MaterialPageRoute(builder: (_) =>  DiseaseDiagnosView());
      case cameraRoute:
        return MaterialPageRoute(builder: (_) => Search());
      case plantIdentityRoute:
        return MaterialPageRoute(builder: (_) => PlantIdentification());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
