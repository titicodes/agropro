import 'package:agropro/pages/base/search/search_vm.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'data/services/navigation_service.dart';

GetIt getIt = GetIt.I;

void setupLocator() {
  setupDio();

  // Services
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerFactory<SearchViewModel>(() => SearchViewModel());
}

void setupDio() {
  getIt.registerFactory(() {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
    return dio;
  });
}
