import 'package:weatherapp/core/models/data_state.dart';
import 'package:weatherapp/weather/domain/entity/weather_alert_ui_model.dart';
import 'package:weatherapp/weather/domain/entity/weather_ui_model.dart';

abstract class IWeatherRepository {
  Future<DataState<WeatherUiModel>> getWeather();
  Future<DataState<WeatherAlertUiModel>> getWeatherAlerts(String place);
  Future<DataState<String>> getWeatherOverview(String place);
}
