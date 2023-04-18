import 'package:weather_app/core/entities/city_weather_entity.dart';

abstract class RestCountriesDataSource {
  Future<CityWeatherEntity> getCapitalsByRegion(String region);
}
