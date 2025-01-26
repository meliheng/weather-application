import 'package:weatherapp/weather/data/model/temperature.dart';

final class Daily {
  final String? date;
  final Temperature? temperature;

  Daily({this.date, this.temperature});

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      date: json['dt_txt'],
      temperature: Temperature.fromJson(json['temperature']),
    );
  }
}
