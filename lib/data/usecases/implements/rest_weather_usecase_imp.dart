import 'package:either_dart/either.dart';
import 'package:weather_app/core/entities/capital_entity.dart';
import 'package:weather_app/core/entities/city_weather_entity.dart';
import 'package:weather_app/data/repository/contracts/rest_weather_repository.dart';
import 'package:weather_app/data/usecases/contracts/rest_weather_usecase.dart';
import '../../../../../core/error/failure.dart';

class RestWeatherUseCaseImp implements RestWeatherUseCase {
  final RestWeatherRepository repository;
  RestWeatherUseCaseImp(this.repository);
  @override
  Future<Either<Failure, CityWeatherEntity>> call(
      CapitalEntity capitalEntity) async {
    return await repository(capitalEntity);
  }
}
