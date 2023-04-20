import 'package:get_it/get_it.dart';
import 'package:weather_app/core/inject/inject_rest_countries.dart';
import 'package:weather_app/core/inject/inject_rest_weather.dart';

import 'inject_http_connections.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  await initInjectRestCountries(getIt);
  await initInjectRestWeather(getIt);
  await initInjectHttpConnections(getIt);
}
