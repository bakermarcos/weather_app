import 'package:weather_app/core/models/clouds_data_model.dart';
import 'package:weather_app/core/models/coordinate_model.dart';
import 'package:weather_app/core/models/main_weather_properties_model.dart';
import 'package:weather_app/core/models/rain_data_model.dart';
import 'package:weather_app/core/models/sys_data_model.dart';
import 'package:weather_app/core/models/weather_data_model.dart';
import 'package:weather_app/core/models/wind_data_model.dart';

class CityWeatherEntity {
//   {
// 	"coord": {
// 		"lon": 55.4667,
// 		"lat": -20.8667
// 	},
// 	"weather": [
// 		{
// 			"id": 500,
// 			"main": "Rain",
// 			"description": "light rain",
// 			"icon": "10n"
// 		}
// 	],
// 	"base": "stations",
// 	"main": {
// 		"temp": 298.21,
// 		"feels_like": 298.99,
// 		"temp_min": 295.78,
// 		"temp_max": 298.25,
// 		"pressure": 1017,
// 		"humidity": 85
// 	},
// 	"visibility": 10000,
// 	"wind": {
// 		"speed": 6.69,
// 		"deg": 110
// 	},
// 	"rain": {
// 		"1h": 0.22
// 	},
// 	"clouds": {
// 		"all": 15
// 	},
// 	"dt": 1681845561,
// 	"sys": {
// 		"type": 1,
// 		"id": 2133,
// 		"country": "RE",
// 		"sunrise": 1681785013,
// 		"sunset": 1681826672
// 	},
// 	"timezone": 14400,
// 	"id": 6690295,
// 	"name": "Saint-Denis",
// 	"cod": 200
// }

  int? id;
  Coordinate? coord;
  List<WeatherData>? weather;
  String? base;
  MainWeatherProperties? main;
  int? visibility;
  WindData? wind;
  RainData? rain;
  CloudsData? clouds;
  int? dt;
  SysData? sys;
  int? timezone;
  String? name;
  int? cod;

  CityWeatherEntity({
    this.id,
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.rain,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.name,
    this.cod,
  });
  
}