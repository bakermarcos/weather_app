import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/core/entities/capital_entity.dart';
import 'package:weather_app/data/usecases/contracts/rest_countries_usecase.dart';
import 'package:weather_app/data/usecases/contracts/rest_weather_usecase.dart';

final capitalsListRepositoryProvider =
    StateNotifierProvider<ListRepository, List<CapitalEntity>>(
  (ref) => ListRepository(),
);

final capitalsListProvider = Provider((ref) {
  final List<CapitalEntity> capitals =
      ref.watch(capitalsListRepositoryProvider);
  return capitals;
});

class ListRepository extends StateNotifier<List<CapitalEntity>> {
  ListRepository() : super([]);
  final RestCountriesUseCase restCountriesUseCase =
      GetIt.I.get<RestCountriesUseCase>();
  final RestWeatherUseCase restWeatherUseCase =
      GetIt.I.get<RestWeatherUseCase>();

  Future<void> updateList(String region) async {
    if (region == '') {
      final response = await restCountriesUseCase.getAllCapitals();
      response.fold((failure) => state = [], (listCapitals) async {
        state = listCapitals;
      });
    } else {
      final response = await restCountriesUseCase.getCapitalsByRegion(region);
      response.fold((failure) => state = [], (listCapitals) async {
        state = listCapitals;
      });
    }
  }

  Future<void> searchWeather() async {
    for (var capital in state) {
      final response = await restWeatherUseCase.call(capital);
      response.fold((failure) => state = state,
          (cityWeatherData) => capital.cityWeather = cityWeatherData);
    }
  }

  void updateOrderList(CapitalEntity clickedCapital) {
    CapitalEntity firstCapital =
        state.firstWhere((capital) => capital == clickedCapital);
    state.add(firstCapital);
    state.remove(state.lastWhere((capital) => capital == clickedCapital));
  }
}
