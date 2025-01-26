import 'package:weatherapp/weather/data/model/current.dart';
import 'package:weatherapp/weather/data/model/daily.dart';

final class WeatherInfoModel {
  final Current? current;
  final List<Daily>? daily;
  WeatherInfoModel({this.current, this.daily});

  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) {
    return WeatherInfoModel(
      current: Current.fromJson(json['current']),
      daily: List<Daily>.from(json['daily'].map((x) => Daily.fromJson(x))),
    );
  }
}

final class UV {
  final double? index;
  final String? level;

  UV({this.index, this.level});

  factory UV.fromJson(Map<String, dynamic> json) {
    return UV(
      index: double.tryParse(json['index'].toString()),
      level: json['level'],
    );
  }
}
