import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/config/constants.dart';

class HttpConections {
  final Dio dio;
  HttpConections(this.dio);

  Future<Response> getConnect({
    required url,
  }) async {
    try {
      dio.options.headers.clear();
      dio.options.connectTimeout = connectTimeout; //5s
      dio.options.receiveTimeout = receiveTimeout;
      dio.options.responseType = ResponseType.json;

      return await dio.get(url);
    } catch (e) {
      rethrow;
    }
  }
}
