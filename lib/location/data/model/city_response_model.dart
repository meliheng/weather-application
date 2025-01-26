final class CityResponseModel {
  final List<String>? cities;
  final int? total;
  final int? perPage;
  CityResponseModel({this.cities, this.total, this.perPage});

  factory CityResponseModel.fromJson(Map<String, dynamic> json) {
    return CityResponseModel(
      // Şehir isimlerini alıp bir listeye dönüştürüyoruz
      cities:
          (json['cities'] as List<dynamic>?)
              ?.map((city) => city['name'] as String)
              .toList(),
      total: json['meta']?['total'],
      perPage: json['meta']?['perPage'],
    );
  }
}
