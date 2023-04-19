import 'package:either_dart/either.dart';
import 'package:weather_app/core/entities/capital_entity.dart';
import 'package:weather_app/core/entities/city_weather_entity.dart';
import '../../../../../core/error/failure.dart';

abstract class RestWeatherUseCase {
  Future<Either<Failure, CityWeatherEntity>> call(
      CapitalEntity capitalEntity);
}
