import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/weather_overview_model.dart';

abstract class WeatherOverviewDataSource {
  Future<WeatherOverviewModel> getWeatherOverview(String city);
}

class WeatherOverviewDataSourceImpl implements WeatherOverviewDataSource {
  final http.Client client;
  static const String _baseUrl = 'https://weather-api167.p.rapidapi.com/api/weather/overview';
  static const String _apiKey = 'YOUR_API_KEY'; // Replace with your actual API key

  WeatherOverviewDataSourceImpl({required this.client});

  @override
  Future<WeatherOverviewModel> getWeatherOverview(String city) async {
    final response = await client.get(
      Uri.parse('$_baseUrl?place=$city'),
      headers: {
        'X-RapidAPI-Key': _apiKey,
        'X-RapidAPI-Host': 'weather-api167.p.rapidapi.com'
      },
    );

    if (response.statusCode == 200) {
      return WeatherOverviewModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather overview');
    }
  }
}
