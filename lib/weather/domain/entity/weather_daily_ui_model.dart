import 'package:weatherapp/weather/data/model/daily.dart';

final class WeatherDailyUiModel {
  final String? date;
  final double? minTemperature;
  final double? maxTemperature;
  final double? dayTemperature;
  final double? nightTemperature;
  final double? eveningTemperature;
  final double? morningTemperature;

  WeatherDailyUiModel({
    this.date,
    this.minTemperature,
    this.maxTemperature,
    this.dayTemperature,
    this.nightTemperature,
    this.eveningTemperature,
    this.morningTemperature,
  });

  factory WeatherDailyUiModel.fromModel({Daily? model}) {
    return WeatherDailyUiModel(
      date: model?.date,
      minTemperature: model?.temperature?.minimum,
      maxTemperature: model?.temperature?.maximum,
      dayTemperature: model?.temperature?.dayTime,
      nightTemperature: model?.temperature?.nightTime,
      eveningTemperature: model?.temperature?.evening,
      morningTemperature: model?.temperature?.morning,
    );
  }
}
