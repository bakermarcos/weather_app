import 'package:get_it/get_it.dart';
import 'package:weather_app/data/datasources/contracts/rest_weather.dart';
import 'package:weather_app/data/datasources/implements/rest_weather_imp.dart';
import 'package:weather_app/data/repository/contracts/rest_weather_repository.dart';
import 'package:weather_app/data/repository/implements/rest_weather_repository_imp.dart';
import 'package:weather_app/data/usecases/contracts/rest_weather_usecase.dart';
import 'package:weather_app/data/usecases/implements/rest_weather_usecase_imp.dart';

Future<void> initInjectRestWeather(GetIt getIt) async {
  getIt.registerLazySingleton<RestWeatherUseCase>(
      () => RestWeatherUseCaseImp(getIt()));

  getIt.registerLazySingleton<RestWeatherRepository>(
      () => RestWeatherRepositoryImp(getIt()));

  getIt.registerLazySingleton<RestWeatherDataSource>(
      () => RestWeatherDataSourceImp(getIt()));
}
