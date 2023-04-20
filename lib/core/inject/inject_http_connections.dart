import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/core/services/http_connections.dart';

Future<void> initInjectHttpConnections(GetIt getIt) async {
  getIt.registerLazySingleton<BaseOptions>(() => BaseOptions());
  getIt.registerLazySingleton<Dio>(() => Dio(getIt()));
  getIt.registerLazySingleton<HttpConections>(() => HttpConections(getIt()));
}
