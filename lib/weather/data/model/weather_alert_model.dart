class WeatherAlertResponse {
  final List<WeatherAlert> alerts;
  final String cityName;
  final String countryCode;
  final double lat;
  final double lon;
  final String stateCode;
  final String timezone;

  WeatherAlertResponse({
    required this.alerts,
    required this.cityName,
    required this.countryCode,
    required this.lat,
    required this.lon,
    required this.stateCode,
    required this.timezone,
  });

  factory WeatherAlertResponse.fromJson(Map<String, dynamic> json) {
    return WeatherAlertResponse(
      alerts: (json['alerts'] as List?)?.map((e) => WeatherAlert.fromJson(e)).toList() ?? [],
      cityName: json['city_name'] ?? '',
      countryCode: json['country_code'] ?? '',
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
      stateCode: json['state_code'] ?? '',
      timezone: json['timezone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'alerts': alerts.map((e) => e.toJson()).toList(),
    'city_name': cityName,
    'country_code': countryCode,
    'lat': lat,
    'lon': lon,
    'state_code': stateCode,
    'timezone': timezone,
  };
}

class WeatherAlert {
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

  WeatherAlert({
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

  factory WeatherAlert.fromJson(Map<String, dynamic> json) {
    return WeatherAlert(
      description: json['description'] ?? '',
      effectiveLocal: DateTime.parse(json['effective_local'] ?? ''),
      effectiveUtc: DateTime.parse(json['effective_utc'] ?? ''),
      endsLocal: DateTime.parse(json['ends_local'] ?? ''),
      endsUtc: DateTime.parse(json['ends_utc'] ?? ''),
      expiresLocal: DateTime.parse(json['expires_local'] ?? ''),
      expiresUtc: DateTime.parse(json['expires_utc'] ?? ''),
      onsetLocal: DateTime.parse(json['onset_local'] ?? ''),
      onsetUtc: DateTime.parse(json['onset_utc'] ?? ''),
      regions: (json['regions'] as List?)?.map((e) => e.toString().trim()).toList() ?? [],
      severity: json['severity'] ?? '',
      title: json['title'] ?? '',
      uri: json['uri'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'description': description,
    'effective_local': effectiveLocal.toIso8601String(),
    'effective_utc': effectiveUtc.toIso8601String(),
    'ends_local': endsLocal.toIso8601String(),
    'ends_utc': endsUtc.toIso8601String(),
    'expires_local': expiresLocal.toIso8601String(),
    'expires_utc': expiresUtc.toIso8601String(),
    'onset_local': onsetLocal.toIso8601String(),
    'onset_utc': onsetUtc.toIso8601String(),
    'regions': regions,
    'severity': severity,
    'title': title,
    'uri': uri,
  };
}
