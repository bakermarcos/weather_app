import 'package:weather_app/core/entities/city_weather_entity.dart';
import 'package:weather_app/core/models/clouds_data_model.dart';
import 'package:weather_app/core/models/coordinate_model.dart';
import 'package:weather_app/core/models/main_weather_properties_model.dart';
import 'package:weather_app/core/models/rain_data_model.dart';
import 'package:weather_app/core/models/sys_data_model.dart';
import 'package:weather_app/core/models/weather_data_model.dart';
import 'package:weather_app/core/models/wind_data_model.dart';

class CityWeatherDto extends CityWeatherEntity {
  CityWeatherDto({
    int? id,
    Coordinate? coord,
    List<WeatherData>? weather,
    String? base,
    MainWeatherProperties? main,
    int? visibility,
    WindData? wind,
    RainData? rain,
    CloudsData? clouds,
    int? dt,
    SysData? sys,
    int? timezone,
    String? name,
    int? cod,
  }) : super(
          id: id,
          coord: coord,
          weather: weather,
          base: base,
          main: main,
          visibility: visibility,
          wind: wind,
          rain: rain,
          clouds: clouds,
          dt: dt,
          sys: sys,
          timezone: timezone,
          name: name,
          cod: cod,
        );

  factory CityWeatherDto.fromJson(Map<String, dynamic> json) {
    return CityWeatherDto(
      name: json['name'] ?? '',
      id: json['id'] ?? 0,
      coord: json['coord'] != null
          ? Coordinate.fromJson(json['coord'])
          : Coordinate.empty(),
      weather: json['weather'] != null
          ? (json['weather'] as List)
              .map((i) => WeatherData.fromJson(i))
              .toList()
          : [],
      base: json['base'] ?? '',
      main: json['main'] != null
          ? MainWeatherProperties.fromJson(json['main'])
          : MainWeatherProperties.empty(),
      visibility: json['visibility'] ?? 0,
      wind: json['wind'] != null
          ? WindData.fromJson(json['wind'])
          : WindData.empty(),
      rain: json['rain'] != null
          ? RainData.fromJson(json['rain'])
          : RainData.empty(),
      clouds: json['clouds'] != null
          ? CloudsData.fromJson(json['clouds'])
          : CloudsData.empty(),
      dt: json['dt'] ?? 0,
      sys:
          json['sys'] != null ? SysData.fromJson(json['sys']) : SysData.empty(),
      timezone: json['timezone'] ?? 0,
      cod: json['cod'] ?? 0,
    );
  }
  CityWeatherEntity toEntity() {
    return CityWeatherEntity(
      id: id,
      coord: coord,
      weather: weather,
      base: base,
      main: main,
      visibility: visibility,
      wind: wind,
      rain: rain,
      clouds: clouds,
      dt: dt,
      sys: sys,
      timezone: timezone,
      name: name,
      cod: cod,
    );
  }
}
