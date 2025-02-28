import 'dart:developer';

import 'package:dio/dio.dart';

import '../../service/auth_manager.dart';

class DioInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("=======================================");
    log("====================${err.toString()}");
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = AuthenticationManager().getToken();
    options.headers["Authorization"] = "Bearer $token";
    log("=======================================");
    log("Request");
    log("url:=> ${options.path}");
    log("content:=> ${options.contentType}");
    log("headers:=> hasToken:$token ");
    log("body:=> ${options.data != null ? options.data! : "Data is null"}");
    log("=======================================");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("=======================================");
    log("Response:");
    log("url:=> ${response.requestOptions.path}");
    log("statusCode:=> ${response.statusCode}");
    log("body:=> hasData: ${response.data != null}");
    log("=======================================");

    // if (response.statusCode == 401 ||
    //     response.data.toLowerCase().contains("unauthorized")) {
    //   preferences.clear();
    //   navigatorKey.currentContext!.goNamed(Routes.login);
    // }
    handler.next(response);
  }
}
