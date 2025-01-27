import 'package:objectbox/objectbox.dart';
import 'package:weatherapp/weather/domain/entity/weather_daily_ui_model.dart';
import 'package:weatherapp/weather/domain/entity/weather_ui_model.dart';

@Entity()
class WeatherModel {
  @Id()
  int id;

  final double? temperature;
  final double? pressure;
  final String? pressureUnit;
  final double? humidity;
  final String? humidityUnit;
  final double? uvIndex;
  final double? windSpeed;
  final String? city;
  final String? description;
  final DateTime? lastUpdated;

  @Backlink()
  final ToMany<DailyWeatherModel> daily = ToMany<DailyWeatherModel>();

  WeatherModel({
    this.id = 0,
    this.temperature,
    this.pressure,
    this.pressureUnit,
    this.humidity,
    this.humidityUnit,
    this.uvIndex,
    this.windSpeed,
    this.city,
    this.lastUpdated,
    this.description,
  });

  factory WeatherModel.fromUiModel(WeatherUiModel model, String city) {
    final weatherModel = WeatherModel(
      temperature: model.temperature,
      pressure: model.pressure,
      pressureUnit: model.pressureUnit,
      humidity: model.humidity,
      humidityUnit: model.humidityUnit,
      uvIndex: model.uvIndex,
      windSpeed: model.windSpeed,
      city: city,
      lastUpdated: DateTime.now(),
      description: model.description,
    );

    // Add daily weather data
    model.daily?.forEach((dailyData) {
      weatherModel.daily.add(
        DailyWeatherModel.fromUiModel(dailyData, weatherModel),
      );
    });

    return weatherModel;
  }

  WeatherUiModel toUiModel() {
    return WeatherUiModel(
      temperature: temperature,
      pressure: pressure,
      pressureUnit: pressureUnit,
      humidity: humidity,
      humidityUnit: humidityUnit,
      uvIndex: uvIndex,
      windSpeed: windSpeed,
      description: description,
      daily: daily.map((d) => d.toUiModel()).toList(),
    );
  }
}

@Entity()
class DailyWeatherModel {
  @Id()
  int id;

  final String? date;
  final double? minTemperature;
  final double? maxTemperature;
  final double? dayTemperature;
  final double? nightTemperature;
  final double? eveningTemperature;
  final double? morningTemperature;

  final ToOne<WeatherModel> weather = ToOne<WeatherModel>();

  DailyWeatherModel({
    this.id = 0,
    this.date,
    this.minTemperature,
    this.maxTemperature,
    this.dayTemperature,
    this.nightTemperature,
    this.eveningTemperature,
    this.morningTemperature,
  });

  factory DailyWeatherModel.fromUiModel(
    WeatherDailyUiModel model,
    WeatherModel parent,
  ) {
    final dailyModel = DailyWeatherModel(
      date: model.date,
      minTemperature: model.minTemperature,
      maxTemperature: model.maxTemperature,
      dayTemperature: model.dayTemperature,
      nightTemperature: model.nightTemperature,
      eveningTemperature: model.eveningTemperature,
      morningTemperature: model.morningTemperature,
    );
    dailyModel.weather.target = parent;
    return dailyModel;
  }

  WeatherDailyUiModel toUiModel() {
    return WeatherDailyUiModel(
      date: date,
      minTemperature: minTemperature,
      maxTemperature: maxTemperature,
      dayTemperature: dayTemperature,
      nightTemperature: nightTemperature,
      eveningTemperature: eveningTemperature,
      morningTemperature: morningTemperature,
    );
  }
}
