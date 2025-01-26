class WeatherOverviewModel {
  final String description;

  WeatherOverviewModel({required this.description});

  factory WeatherOverviewModel.fromJson(Map<String, dynamic> json) {
    return WeatherOverviewModel(
      description: json['description'] ?? 'Weather information unavailable',
    );
  }
}
