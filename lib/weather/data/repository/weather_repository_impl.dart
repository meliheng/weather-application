import 'package:flutter/material.dart';
import 'package:weatherapp/core/models/data_state.dart';
import 'package:weatherapp/weather/data/data_source/weather_remote_datasource.dart';
import 'package:weatherapp/weather/domain/entity/weather_alert_ui_model.dart';
import 'package:weatherapp/weather/domain/entity/weather_ui_model.dart';
import 'package:weatherapp/weather/domain/repository/i_weather_repository.dart';

final class WeatherRepositoryImpl implements IWeatherRepository {
  final WeatherRemoteDatasource _remoteDataSource;

  WeatherRepositoryImpl(this._remoteDataSource);
  @override
  Future<DataState<WeatherUiModel>> getWeather() async {
    try {
      var result = await _remoteDataSource.getFullInfo();
      return DataSuccess(WeatherUiModel.fromModel(model: result));
    } on FlutterError catch (error) {
      return DataFailed(error);
    }
  }

  @override
  Future<DataState<WeatherAlertUiModel>> getWeatherAlerts(String place) async {
    try {
      var result = await _remoteDataSource.getWeatherAlerts(place);
      return DataSuccess(WeatherAlertUiModel.fromModel(model: result));
    } on FlutterError catch (error) {
      return DataFailed(error);
    }
  }

  @override
  Future<DataState<String>> getWeatherOverview(String place) async {
    try {
      final result = await _remoteDataSource.getWeatherOverview(place);
      return DataSuccess(result.substring(0, 12));
    } on FlutterError catch (error) {
      return DataFailed(error);
    }
  }
}
