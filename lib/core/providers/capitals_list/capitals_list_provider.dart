import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/core/entities/capital_entity.dart';
import 'package:weather_app/data/usecases/contracts/rest_countries_usecase.dart';

final filterCapitalsListProvider = ChangeNotifierProvider(
  (ref) => FilterCapitalsListProvider([]),
);

class FilterCapitalsListProvider extends ValueNotifier<List<CapitalEntity>> {
  FilterCapitalsListProvider(List<CapitalEntity> listCapitals)
      : super(listCapitals);
  final RestCountriesUseCase restCountriesUseCase = GetIt.I();

  updateList(String region) {
    final response = restCountriesUseCase.call(region);
    response.fold(
        (failure) => value = value, (listCapitals) => value = listCapitals);
  }
}
