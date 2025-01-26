import 'package:weatherapp/location/data/model/city_response_model.dart';

final class CityUiModel {
  final List<String>? cities;
  final int? total;
  final int? perPage;
  CityUiModel({this.cities, this.total, this.perPage});

  factory CityUiModel.fromModel({CityResponseModel? model}) {
    return CityUiModel(
      cities: model?.cities,
      total: model?.total,
      perPage: model?.perPage,
    );
  }
}
