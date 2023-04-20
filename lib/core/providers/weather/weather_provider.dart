import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/core/entities/capital_entity.dart';
import 'package:weather_app/core/entities/city_weather_entity.dart';
import 'package:weather_app/data/usecases/contracts/rest_weather_usecase.dart';

final weatherProvider = ChangeNotifierProvider(
  (ref) => WeatherProvider(CityWeatherEntity()),
);

class WeatherProvider extends ValueNotifier<CityWeatherEntity> {
  WeatherProvider(CityWeatherEntity cityWeatherData) : super(cityWeatherData);
  final RestWeatherUseCase restWeatherUseCase = GetIt.I.get<RestWeatherUseCase>();

  Future<void> updateCityWeatherData(CapitalEntity capitalEntity) async {
    final response = await restWeatherUseCase.call(capitalEntity);
    response.fold((failure) => value = value,
        (cityWeatherData) => value = cityWeatherData);
  }
}
