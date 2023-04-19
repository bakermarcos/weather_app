import 'package:either_dart/either.dart';
import 'package:weather_app/core/entities/capital_entity.dart';
import 'package:weather_app/core/entities/city_weather_entity.dart';
import 'package:weather_app/data/datasources/contracts/rest_weather.dart';
import 'package:weather_app/data/repository/contracts/rest_weather_repository.dart';
import '../../../../core/error/failure.dart';

class RestWeatherRepositoryImp implements RestWeatherRepository {
  final RestWeatherDataSource dataSource;
  RestWeatherRepositoryImp(this.dataSource);
  @override
  Future<Either<Failure, CityWeatherEntity>> call(
      CapitalEntity capitalEntity) async {
    try {
      return Right(await dataSource.getWeatherData(capitalEntity));
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
