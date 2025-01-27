final class CityResponseModel {
  final List<String>? cities;
  CityResponseModel({this.cities});

  factory CityResponseModel.fromJson(Map<String, dynamic> json) {
    return CityResponseModel(
      cities:
          (json['cities'] as List<dynamic>?)
              ?.map((city) => city['name'] as String)
              .toList(),
    );
  }
}
