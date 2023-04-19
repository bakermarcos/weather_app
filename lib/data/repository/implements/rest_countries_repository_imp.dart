import 'package:either_dart/either.dart';
import 'package:weather_app/core/entities/capital_entity.dart';
import 'package:weather_app/data/datasources/contracts/rest_countries.dart';
import 'package:weather_app/data/repository/contracts/rest_countries_repository.dart';
import '../../../../core/error/failure.dart';

class RestCountriesRepositoryImp implements RestCountriesRepository {
  final RestCountriesDataSource dataSource;
  RestCountriesRepositoryImp(this.dataSource);
  @override
  Future<Either<Failure, List<CapitalEntity>>> call(String region) async {
    try {
      return Right(await dataSource.getCapitalsByRegion(region));
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
