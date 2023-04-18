import 'package:dio/dio.dart';
import 'package:weather_app/core/config/constants.dart';
import 'package:weather_app/core/entities/capital_entity.dart';
import 'package:weather_app/core/error/failure_imp.dart';
import 'package:weather_app/core/services/http_connections.dart';
import 'package:weather_app/data/datasources/contracts/rest_countries.dart';
import 'package:weather_app/data/dtos/capital_dto.dart';

class RestCountriesDataSourceImp implements RestCountriesDataSource {
  final HttpConections _apiProvider;
  RestCountriesDataSourceImp(this._apiProvider);

  @override
  Future<List<CapitalEntity>> getCapitalsByRegion(String region) async {
    try {
      var response = await _apiProvider.getConnect(
          url:
              'https://restcountries.com/v3.1/region/$region?fields=name,capital,capitalInfo,cca2');
      if (response.statusCode == okStatus) {
        List<CapitalEntity> capitalsList = (response.data as List<dynamic>)
            .map((e) => CapitalDto.fromJson(e).toEntity())
            .toList();
        return capitalsList;
      } else {
        throw FailureImp(msg: response.data['mensagem']);
      }
    } on DioError catch (dioError) {
      if (dioError.response != null) {
        switch (dioError.response!.statusCode) {
          case badRequestStatus:
            throw FailureImp(msg: 'Check if all fields are filled');
          case notAuthorizedStatus:
            throw FailureImp(msg: 'Not Authorized');
          case notFoundStatus:
            throw FailureImp(msg: 'Not Found');
          case foundStatus:
            throw FailureImp(msg: "");
          case internalErrorStatus:
            throw FailureImp(msg: occuredErrorMessage);
          default:
            throw FailureImp(
                msg: dioError.response?.data is String ||
                        dioError.response?.data['message'] == null
                    ? occuredErrorMessage
                    : dioError.response?.data['message']);
        }
      } else {
        throw FailureImp(msg: connectionErrorMessage);
      }
    }
  }
}
