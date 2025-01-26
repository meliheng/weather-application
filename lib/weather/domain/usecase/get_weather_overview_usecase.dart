import 'package:weatherapp/core/models/data_state.dart';
import 'package:weatherapp/weather/domain/repository/i_weather_repository.dart';

class GetWeatherOverviewUsecase {
  final IWeatherRepository _repository;

  GetWeatherOverviewUsecase(this._repository);

  Future<DataState<String>> execute(String place) async {
    return await _repository.getWeatherOverview(place);
  }
}
