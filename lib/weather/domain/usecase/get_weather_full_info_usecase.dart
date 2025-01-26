import 'package:weatherapp/core/models/data_state.dart';
import 'package:weatherapp/weather/domain/entity/weather_ui_model.dart';
import 'package:weatherapp/weather/domain/repository/i_weather_repository.dart';

final class GetWeatherFullInfoUsecase {
  final IWeatherRepository _weatherRepository;

  GetWeatherFullInfoUsecase(this._weatherRepository);

  Future<DataState<WeatherUiModel>> execute() async {
    return _weatherRepository.getWeather();
  }
}
