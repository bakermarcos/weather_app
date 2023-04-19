import 'package:either_dart/either.dart';
import 'package:weather_app/core/entities/capital_entity.dart';
import '../../../../core/error/failure.dart';

abstract class RestCountriesRepository {
  Future<Either<Failure, List<CapitalEntity>>> call(String region);
}
