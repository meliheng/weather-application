import 'package:weatherapp/weather/data/model/weather_info_model.dart';

final class Current {
  final double? temperature;
  final double? pressure;
  final String? pressureUnit;
  final double? humidity;
  final String? humidityUnit;
  final double? windSpeed;
  final double? rain;
  final String? description;
  final UV? uv;

  Current({
    this.temperature,
    this.pressure,
    this.pressureUnit,
    this.humidity,
    this.humidityUnit,
    this.uv,
    this.windSpeed,
    this.rain,
    this.description,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      temperature: double.tryParse(json['temperature'].toString()),
      pressure: double.tryParse(json['pressure'].toString()),
      pressureUnit: json['pressureUnit'],
      humidity: double.tryParse(json['humidity'].toString()),
      humidityUnit: json['humidityUnit'],
      uv: UV.fromJson(json['uv']),
      windSpeed: double.tryParse(json['wind']['speed'].toString()),
      rain: double.tryParse(json['rain']['amount'].toString()),
      description:
          json['weather'] != null ? json['weather'][0]['description'] : null,
    );
  }
}
