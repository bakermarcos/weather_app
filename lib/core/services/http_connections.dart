import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/config/constants.dart';

class HttpConections {
  final Dio dio;
  HttpConections(this.dio);
  bool emTeste = false;

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<Response> getConnect({required url, token = ''}) async {
    String apiToken = await _getToken() ?? token;

    if (kDebugMode) {
      print('token : $apiToken');
      print('url : $url');
    }

    try {
      dio.options.headers.clear();
      dio.options.headers['Authorization'] = 'Bearer $apiToken';
      dio.options.connectTimeout = connectTimeout; //5s
      dio.options.receiveTimeout = receiveTimeout;
      dio.options.responseType = ResponseType.json;

      return await dio.get(url);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> postConnect(
      {required url, required data, token = ""}) async {
    String apiToken = await _getToken() ?? token;

    if (kDebugMode) {
      print('token : $apiToken');
      print('url : $url');
      print('postData : $data');
    }

    try {
      dio.options.headers.clear();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $apiToken';
      dio.options.connectTimeout = connectTimeout; //5s
      dio.options.receiveTimeout = receiveTimeout;
      dio.options.responseType = ResponseType.json;

      return await dio.post(url, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> putConnect({required url, required data, token = ""}) async {
    String apiToken = await _getToken() ?? token;

    if (kDebugMode) {
      print('token : $apiToken');
      print('url : $url');
      print('postData : $data');
    }

    try {
      dio.options.headers.clear();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $apiToken';
      dio.options.connectTimeout = connectTimeout; //5s
      dio.options.receiveTimeout = receiveTimeout;

      return await dio.put(url, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delConnect({required url, token = ""}) async {
    String apiToken = await _getToken() ?? token;

    try {
      dio.options.headers['Authorization'] = 'Bearer $apiToken';
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.connectTimeout = connectTimeout; //5s
      dio.options.receiveTimeout = receiveTimeout;

      return await dio.delete(url);
    } catch (e) {
      rethrow;
    }
  }
}
