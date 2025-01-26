import 'package:equatable/equatable.dart';
import 'package:weatherapp/weather/data/model/weather_alert_model.dart';

class WeatherAlertUiModel extends Equatable {
  final List<AlertUiModel> alerts;
  final String cityName;
  final String countryCode;
  final double lat;
  final double lon;
  final String stateCode;
  final String timezone;

  const WeatherAlertUiModel({
    required this.alerts,
    required this.cityName,
    required this.countryCode,
    required this.lat,
    required this.lon,
    required this.stateCode,
    required this.timezone,
  });

  factory WeatherAlertUiModel.fromModel({
    required WeatherAlertResponse model,
  }) => WeatherAlertUiModel(
    alerts: model.alerts.map((e) => AlertUiModel.fromModel(model: e)).toList(),
    cityName: model.cityName,
    countryCode: model.countryCode,
    lat: model.lat,
    lon: model.lon,
    stateCode: model.stateCode,
    timezone: model.timezone,
  );

  @override
  List<Object?> get props => [
    alerts,
    cityName,
    countryCode,
    lat,
    lon,
    stateCode,
    timezone,
  ];
}

class AlertUiModel extends Equatable {
  final String description;
  final DateTime effectiveLocal;
  final DateTime effectiveUtc;
  final DateTime endsLocal;
  final DateTime endsUtc;
  final DateTime expiresLocal;
  final DateTime expiresUtc;
  final DateTime onsetLocal;
  final DateTime onsetUtc;
  final List<String> regions;
  final String severity;
  final String title;
  final String uri;

  const AlertUiModel({
    required this.description,
    required this.effectiveLocal,
    required this.effectiveUtc,
    required this.endsLocal,
    required this.endsUtc,
    required this.expiresLocal,
    required this.expiresUtc,
    required this.onsetLocal,
    required this.onsetUtc,
    required this.regions,
    required this.severity,
    required this.title,
    required this.uri,
  });

  factory AlertUiModel.fromModel({required WeatherAlert model}) => AlertUiModel(
    description: model.description,
    effectiveLocal: model.effectiveLocal,
    effectiveUtc: model.effectiveUtc,
    endsLocal: model.endsLocal,
    endsUtc: model.endsUtc,
    expiresLocal: model.expiresLocal,
    expiresUtc: model.expiresUtc,
    onsetLocal: model.onsetLocal,
    onsetUtc: model.onsetUtc,
    regions: model.regions,
    severity: model.severity,
    title: model.title,
    uri: model.uri,
  );

  bool get isActive {
    final now = DateTime.now();
    return now.isAfter(effectiveLocal) && now.isBefore(endsLocal);
  }

  String get timeStatus {
    final now = DateTime.now();
    if (now.isBefore(effectiveLocal)) {
      return 'Upcoming';
    } else if (now.isAfter(endsLocal)) {
      return 'Ended';
    } else {
      return 'Active';
    }
  }

  String get formattedTimeRange {
    return '${effectiveLocal.toString()} - ${endsLocal.toString()}';
  }

  @override
  List<Object?> get props => [
    description,
    effectiveLocal,
    effectiveUtc,
    endsLocal,
    endsUtc,
    expiresLocal,
    expiresUtc,
    onsetLocal,
    onsetUtc,
    regions,
    severity,
    title,
    uri,
  ];
}
