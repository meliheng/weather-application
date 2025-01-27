import 'package:weatherapp/weather/data/model/weather_info_model.dart';
import 'package:weatherapp/weather/domain/entity/weather_daily_ui_model.dart';

final class WeatherUiModel {
  final double? temperature;
  final double? pressure;
  final String? pressureUnit;
  final double? humidity;
  final String? humidityUnit;
  final double? uvIndex;
  final double? windSpeed;
  final double? rain;
  final String? description;
  final List<WeatherDailyUiModel>? daily;
  WeatherUiModel({
    this.temperature,
    this.pressure,
    this.pressureUnit,
    this.humidity,
    this.humidityUnit,
    this.uvIndex,
    this.windSpeed,
    this.daily,
    this.rain,
    this.description,
  });

  factory WeatherUiModel.fromModel({WeatherInfoModel? model}) {
    return WeatherUiModel(
      temperature: model?.current?.temperature,
      pressure: model?.current?.pressure,
      pressureUnit: model?.current?.pressureUnit,
      humidity: model?.current?.humidity,
      humidityUnit: model?.current?.humidityUnit,
      uvIndex: model?.current?.uv?.index,
      windSpeed: model?.current?.windSpeed,
      rain: model?.current?.rain,
      description: model?.current?.description,
      daily:
          model?.daily
              ?.map((e) => WeatherDailyUiModel.fromModel(model: e))
              .toList(),
    );
  }
}
