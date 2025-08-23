import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import '../../locator.dart';
import '../../utils/snack_message.dart';
import '../core/network/error_handler.dart';
import '../core/network/urlPath.dart';
import '../core/storage/get_boxes.dart';
import '../model/auth_response.dart';

/// This calls implements the UserRemote logic
class RemoteServices {
 // final UserServices userServices;
  //AppCache cache = getIt<AppCache>();
  final Dio dio;

  RemoteServices(
    this.dio,
    //this.userServices,
  );



  @override
  Future<AuthResponse?> login(String email, String password) async {
    final box = GetStorage();
    try {
      // the required parameters
      var dataBody = {
        'email': email,
        'password': password,
      };
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.login}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
          }));
      final responseData = AuthResponse.fromJson(response.data);
      // trying to get the token from the response and storing using secureStoragee
      final token = responseData.data;
      snackBars(token!, true);
      box.write('token', token.toString());
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }

  @override
  Future<Response> bucxtobucx(String token, String receiverEmail, String nickname, String amount, String idempotencyKey) async {
    final box = GetStorage();
    String? userToken = box.read(Boxes.userToken);
    var dataBody = {
      'type' : 'bucxtobucx',
      'data': {'sender': {
        'currency': 'usdc',
      },
        'receiver': {
          'email': receiverEmail,
          'currency': 'usdc',
          'nickname': nickname
        },
        'amount': amount,
        'idempotency_key': idempotencyKey,}
    };

    try {
      Dio dio = Dio();
      var response = await dio.post(
        "${Config.BASEURL}${UrlPath.initiateTransfer}",
        data: dataBody, // ✅ pass the body here
        options: Options(
          followRedirects: true,
          headers: {
            "Accept": "application/json",
            'Authorization': "Bearer $userToken",
          },
        ),
      );
      return response;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }
 }