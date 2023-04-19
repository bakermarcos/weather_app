import 'package:weather_app/core/entities/capital_entity.dart';
import 'package:weather_app/core/entities/city_weather_entity.dart';

abstract class RestWeatherDataSource {
  Future<CityWeatherEntity> getWeatherData(CapitalEntity capitalEntity);
}
