import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:weatherapp/core/constants/api_constants.dart';
import 'package:weatherapp/core/constants/global_constants.dart';
import 'package:weatherapp/core/helper/network/http_service.dart';
import 'package:weatherapp/core/helper/storage/user_location_storage_helper.dart';
import 'package:weatherapp/core/helper/storage/weather_storage_helper.dart';
import 'package:weatherapp/weather/data/model/current.dart';
import 'package:weatherapp/weather/data/model/daily.dart';
import 'package:weatherapp/weather/data/model/temperature.dart';
import 'package:weatherapp/weather/data/model/weather_alert_model.dart';
import 'package:weatherapp/weather/data/model/weather_info_model.dart';
import 'package:weatherapp/weather/domain/entity/weather_ui_model.dart';

abstract class WeatherRemoteDatasource {
  Future<WeatherInfoModel> getFullInfo();
  Future<WeatherAlertResponse> getWeatherAlerts(String place);
  Future<String> getWeatherOverview(String place);
}

final class WeatherRemoteDataSourceImpl implements WeatherRemoteDatasource {
  late final HttpService _httpService;

  WeatherRemoteDataSourceImpl() {
    _httpService = HttpService();
  }

  @override
  Future<WeatherInfoModel> getFullInfo() async {
    try {
      GlobalConstants.isOffline = false;
      final place = await UserLocationStorageHelper.getCity();

      try {
        // Try to get data from API
        final response = await _httpService.get(
          ApiConstants.fullInfoPath,
          queryParameters: {"place": place, "units": "metric"},
        );
        final weatherInfo = WeatherInfoModel.fromJson(
          json.decode(response.body),
        );

        // Save the weather data locally
        await WeatherStorageHelper.saveWeather(
          WeatherUiModel.fromModel(model: weatherInfo),
          place,
        );

        return weatherInfo;
      } catch (e) {
        // If network request fails, try to get cached data
        final cachedWeather = await WeatherStorageHelper.getLastWeather(place);
        if (cachedWeather != null) {
          GlobalConstants.isOffline = true;
          // Convert back to WeatherInfoModel format
          return WeatherInfoModel(
            current: Current(
              temperature: cachedWeather.temperature,
              pressure: cachedWeather.pressure,
              pressureUnit: cachedWeather.pressureUnit,
              humidity: cachedWeather.humidity,
              humidityUnit: cachedWeather.humidityUnit,
              windSpeed: cachedWeather.windSpeed,
              description: cachedWeather.description,
              uv: UV(index: cachedWeather.uvIndex),
            ),
            daily:
                cachedWeather.daily
                    ?.map(
                      (d) => Daily(
                        date: d.date,
                        temperature: Temperature(
                          minimum: d.minTemperature,
                          maximum: d.maxTemperature,
                          dayTime: d.dayTemperature,
                          nightTime: d.nightTemperature,
                          evening: d.eveningTemperature,
                          morning: d.morningTemperature,
                        ),
                      ),
                    )
                    .toList(),
          );
        }
        throw FlutterError("Something Went Wrong!");
      }
    } on Exception catch (_) {
      throw FlutterError("Something Went Wrong!");
    }
  }

  @override
  Future<WeatherAlertResponse> getWeatherAlerts(String place) async {
    try {
      final response = await _httpService.get(
        "${ApiConstants.weatherAlertsPath}?place=$place",
      );
      return WeatherAlertResponse.fromJson(json.decode(response.body));
    } on Exception catch (_) {
      throw Error();
    }
  }

  @override
  Future<String> getWeatherOverview(String place) async {
    try {
      final response = await _httpService.get(
        ApiConstants.overviewPath,
        queryParameters: {"place": place},
      );
      final data = json.decode(response.body);
      return data['weather_overview'] ?? 'Weather information unavailable';
    } catch (e) {
      throw FlutterError('Failed to load weather overview: $e');
    }
  }
}
