import 'package:weatherapp/location/data/model/city_response_model.dart';

final class CityUiModel {
  final List<String>? cities;
  CityUiModel({this.cities});

  factory CityUiModel.fromModel({CityResponseModel? model}) {
    return CityUiModel(cities: model?.cities);
  }
}
