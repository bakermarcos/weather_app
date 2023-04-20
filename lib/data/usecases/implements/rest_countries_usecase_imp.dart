import 'package:either_dart/either.dart';
import 'package:weather_app/core/entities/capital_entity.dart';
import 'package:weather_app/data/repository/contracts/rest_countries_repository.dart';
import 'package:weather_app/data/usecases/contracts/rest_countries_usecase.dart';
import '../../../../../core/error/failure.dart';

class RestCountriesUseCaseImp implements RestCountriesUseCase {
  final RestCountriesRepository repository;
  RestCountriesUseCaseImp(this.repository);
  @override
  Future<Either<Failure, List<CapitalEntity>>> getCapitalsByRegion(
      String region) async {
    return await repository.getCapitalsByRegion(region);
  }

  @override
  Future<Either<Failure, List<CapitalEntity>>> getAllCapitals() async {
    return await repository.getAllCapitals();
  }
}
