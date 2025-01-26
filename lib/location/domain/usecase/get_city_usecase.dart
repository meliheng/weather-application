import 'package:weatherapp/core/models/data_state.dart';
import 'package:weatherapp/location/domain/entity/city_ui_model.dart';
import 'package:weatherapp/location/domain/repository/i_city_repository.dart';

final class GetCityUsecase {
  final ICityRepository _cityRepository;

  GetCityUsecase(this._cityRepository);

  Future<DataState<CityUiModel>> execute({String? query}) async {
    return _cityRepository.getCities(query: query);
  }
}
