import 'package:weatherapp/core/models/data_state.dart';
import 'package:weatherapp/location/domain/entity/city_ui_model.dart';

abstract class ICityRepository {
  Future<DataState<CityUiModel>> getCities({String? query});
}
