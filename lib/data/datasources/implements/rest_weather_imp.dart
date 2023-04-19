import 'package:dio/dio.dart';
import 'package:weather_app/core/config/constants.dart';
import 'package:weather_app/core/entities/capital_entity.dart';
import 'package:weather_app/core/entities/city_weather_entity.dart';
import 'package:weather_app/core/error/failure_imp.dart';
import 'package:weather_app/core/services/http_connections.dart';
import 'package:weather_app/data/datasources/contracts/rest_weather.dart';
import 'package:weather_app/data/dtos/city_weather_dto.dart';

class RestWeatherDataSourceImp implements RestWeatherDataSource {
  final HttpConections _apiProvider;
  RestWeatherDataSourceImp(this._apiProvider);

  @override
  Future<CityWeatherEntity> getWeatherData(CapitalEntity capitalEntity) async {
    String capitalName = capitalEntity.capital ?? '';
    String cca2 = capitalEntity.cca2 ?? '';
    try {
      var response = await _apiProvider.getConnect(
          url:
              'https://api.openweathermap.org/data/2.5/weather?q=$capitalName,$cca2&appid=$restWeatherApiKey');
      if (response.statusCode == okStatus) {
        CityWeatherEntity cityWeatherEntity =
            CityWeatherDto.fromJson(response.data).toEntity();
        return cityWeatherEntity;
      } else {
        throw FailureImp(msg: response.data['message']);
      }
    } on DioError catch (dioError) {
      if (dioError.response != null) {
        switch (dioError.response!.statusCode) {
          case badRequestStatus:
            throw FailureImp(msg: 'Check if capital name is correct');
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
