import 'package:weatherapp/core/models/data_state.dart';
import 'package:weatherapp/weather/domain/entity/weather_alert_ui_model.dart';
import 'package:weatherapp/weather/domain/repository/i_weather_repository.dart';

final class GetWeatherAlertUsecase {
  final IWeatherRepository _weatherRepository;

  GetWeatherAlertUsecase(this._weatherRepository);

  Future<DataState<WeatherAlertUiModel>> execute(String place) async {
    return _weatherRepository.getWeatherAlerts(place);
  }
}
