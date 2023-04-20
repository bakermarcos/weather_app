import 'package:weather_app/core/entities/capital_entity.dart';

abstract class RestCountriesDataSource {
  Future<List<CapitalEntity>> getCapitalsByRegion(String region);
  Future<List<CapitalEntity>> getAllCapitals();

}
