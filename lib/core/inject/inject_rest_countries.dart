import 'package:get_it/get_it.dart';
import 'package:weather_app/data/datasources/contracts/rest_countries.dart';
import 'package:weather_app/data/datasources/implements/rest_countries_imp.dart';
import 'package:weather_app/data/repository/contracts/rest_countries_repository.dart';
import 'package:weather_app/data/repository/implements/rest_countries_repository_imp.dart';
import 'package:weather_app/data/usecases/contracts/rest_countries_usecase.dart';
import 'package:weather_app/data/usecases/implements/rest_countries_usecase_imp.dart';

Future<void> initInjectRestCountries(GetIt getIt) async {
  getIt.registerLazySingleton<RestCountriesUseCase>(
      () => RestCountriesUseCaseImp(getIt()));

  getIt.registerLazySingleton<RestCountriesRepository>(
      () => RestCountriesRepositoryImp(getIt()));

  getIt.registerLazySingleton<RestCountriesDataSource>(
      () => RestCountriesDataSourceImp(getIt()));
}
