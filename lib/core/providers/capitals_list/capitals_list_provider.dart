import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/core/entities/capital_entity.dart';
import 'package:weather_app/data/usecases/contracts/rest_countries_usecase.dart';
import 'package:weather_app/data/usecases/contracts/rest_weather_usecase.dart';

final filterCapitalsListProvider = ChangeNotifierProvider(
  (ref) => FilterCapitalsListProvider([]),
);

class FilterCapitalsListProvider extends ValueNotifier<List<CapitalEntity>> {
  FilterCapitalsListProvider(
    List<CapitalEntity> listCapitals,
  ) : super(listCapitals);
  final RestCountriesUseCase restCountriesUseCase =
      GetIt.I.get<RestCountriesUseCase>();
  final RestWeatherUseCase restWeatherUseCase =
      GetIt.I.get<RestWeatherUseCase>();

  Future<void> updateList(String region) async {
    final response = await restCountriesUseCase.call(region);
    response.fold((failure) => value = value, (listCapitals) async {
      value = listCapitals;
      for (var capital in value) {
        final response = await restWeatherUseCase.call(capital);
        response.fold((failure) => value = value,
            (cityWeatherData) => capital.cityWeather = cityWeatherData);
      }
    });
  }

  void updateOrderList(CapitalEntity clickedCapital) {
    CapitalEntity firstCapital =
        value.firstWhere((capital) => capital == clickedCapital);
    value.add(firstCapital);
    value.remove(value.lastWhere((capital) => capital == clickedCapital));
  }
}
