import 'package:weather_app/core/entities/capital_entity.dart';
import 'package:weather_app/core/entities/city_weather_entity.dart';

class CapitalDto extends CapitalEntity {
  CapitalDto({
    String? capital,
    String? region,
    String? countryName,
    List<dynamic>? latlng,
    String? cca2,
    CityWeatherEntity? cityWeather,
  }) : super(
          capital: capital,
          region: region,
          countryName: countryName,
          latlng: latlng,
          cca2: cca2,
          cityWeather: cityWeather,
        );

  factory CapitalDto.fromJson(Map<String, dynamic> json) {
    return CapitalDto(
      capital: json['capital'] ?? '',
      region: json['region'] ?? '',
      countryName: json['name'] != null ? json['name']['common'] ?? '' : '',
      latlng: json['latlng'] ?? const [],
      cca2: json['cca2'] ?? '',
      cityWeather: json['cityWeather'] ?? CityWeatherEntity(),
    );
  }

  CapitalEntity toEntity() {
    return CapitalEntity(
      capital: capital,
      region: region,
      countryName: countryName,
      latlng: latlng,
      cca2: cca2,
      cityWeather: cityWeather,
    );
  }
}
