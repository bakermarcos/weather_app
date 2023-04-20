import 'package:weather_app/core/entities/city_weather_entity.dart';

class CapitalEntity {
  final String? capital;
  final String? region;
  final String? countryName;
  final List<dynamic>? latlng;
  final String? cca2;
  CityWeatherEntity? cityWeather;

  CapitalEntity(
      {this.capital,
      this.region,
      this.countryName,
      this.latlng,
      this.cca2,
      this.cityWeather});

  CapitalEntity.empty({
    this.capital = '',
    this.region = '',
    this.countryName = '',
    this.latlng = const [],
    this.cca2 = '',
    this.cityWeather,
  });
}
