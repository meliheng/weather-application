import 'dart:convert';

import 'package:weatherapp/core/constants/api_constants.dart';
import 'package:weatherapp/core/helper/network/http_service.dart';
import 'package:weatherapp/location/data/model/city_response_model.dart';

abstract class CityRemoteDatasource {
  Future<CityResponseModel> getCities({String? query});
}

final class CityRemoteDataSourceImpl implements CityRemoteDatasource {
  late final HttpService _httpService;

  CityRemoteDataSourceImpl() {
    _httpService = HttpService(
      baseUrl: ApiConstants.cityBaseUrl,
      defaultHeaders: {},
    );
  }

  @override
  Future<CityResponseModel> getCities({String? query}) async {
    try {
      final response = await _httpService.get(
        "/locations/cities",
        queryParameters: {if (query != null) "search": query},
      );
      return CityResponseModel.fromJson(json.decode(response.body));
    } on Exception catch (_) {
      throw Error();
    }
  }
}
