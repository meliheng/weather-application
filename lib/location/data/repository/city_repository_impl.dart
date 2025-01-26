import 'package:flutter/material.dart';
import 'package:weatherapp/core/models/data_state.dart';
import 'package:weatherapp/location/data/data_source/city_remote_datasource.dart';
import 'package:weatherapp/location/domain/entity/city_ui_model.dart';
import 'package:weatherapp/location/domain/repository/i_city_repository.dart';

final class CityRepositoryImpl implements ICityRepository {
  final CityRemoteDatasource _remoteDataSource;

  CityRepositoryImpl(this._remoteDataSource);
  @override
  Future<DataState<CityUiModel>> getCities({String? query}) async {
    try {
      var result = await _remoteDataSource.getCities(query: query);
      return DataSuccess(CityUiModel.fromModel(model: result));
    } on FlutterError catch (error) {
      return DataFailed(error);
    }
  }
}
