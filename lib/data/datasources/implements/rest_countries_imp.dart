import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
      debugPrint(response.data.toString());
      if (response.statusCode == okStatus) {
        List<CapitalEntity> capitalsList =
            (response.data as List<dynamic>).map((capital) {
          if (capital != null) {
            return CapitalDto.fromJson(capital).toEntity();
          } else {
            return CapitalDto.empty();
          }
        }).toList();
        return capitalsList;
      } else {
        throw FailureImp(msg: response.data['message']);
      }
    } on DioError catch (dioError) {
      debugPrint(dioError.toString());
      if (dioError.response != null) {
        switch (dioError.response!.statusCode) {
          case badRequestStatus:
            throw FailureImp(msg: 'Check if the region is correct');
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
        debugPrint(dioError.toString());
        throw FailureImp(msg: connectionErrorMessage);
      }
    }
  }

  @override
  Future<List<CapitalEntity>> getAllCapitals() async {
    try {
      var response = await _apiProvider.getConnect(
          url:
              'https://restcountries.com/v3.1/all?fields=name,capital,capitalInfo,cca2');
      debugPrint(response.data.toString());
      if (response.statusCode == okStatus) {
        List<CapitalEntity> capitalsList =
            (response.data as List<dynamic>).map((capital) {
          if (capital != null) {
            return CapitalDto.fromJson(capital).toEntity();
          } else {
            return CapitalDto.empty();
          }
        }).toList();
        return capitalsList;
      } else {
        throw FailureImp(msg: response.data['message']);
      }
    } on DioError catch (dioError) {
      debugPrint(dioError.toString());
      if (dioError.response != null) {
        switch (dioError.response!.statusCode) {
          case badRequestStatus:
            throw FailureImp(msg: 'Check if the region is correct');
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
        debugPrint(dioError.toString());
        throw FailureImp(msg: connectionErrorMessage);
      }
    }
  }
}
