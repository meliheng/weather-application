import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weatherapp/core/helper/storage/user_location_storage_helper.dart';
import 'package:weatherapp/core/models/data_state.dart';
import 'package:weatherapp/location/domain/entity/city_ui_model.dart';
import 'package:weatherapp/location/domain/usecase/get_city_usecase.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final GetCityUsecase _getCityUsecase;
  CityBloc(this._getCityUsecase) : super(CityInitial()) {
    on<CitySearchEvent>(
      _onCitySearchEvent,
      transformer: (events, mapper) {
        return events
            .debounceTime(const Duration(seconds: 1))
            .switchMap(mapper);
      },
    );
    on<CitySelectEvent>(_onCityChanged);
  }

  FutureOr<void> _onCitySearchEvent(
    CitySearchEvent event,
    Emitter<CityState> emit,
  ) async {
    emit(CityLoading());
    final result = await _getCityUsecase.execute(query: event.query);
    if (result is DataSuccess) {
      emit(CityLoaded(cityUiModel: result.data!));
    } else if (result is DataFailed) {
      emit(CityError(message: result.error?.message ?? ''));
    }
  }

  FutureOr<void> _onCityChanged(
    CitySelectEvent event,
    Emitter<CityState> emit,
  ) async {
    try {
      await UserLocationStorageHelper.saveCity(event.city);
      emit(CitySaved());
    } catch (e) {
      emit(CityError(message: e.toString()));
    }
  }
}
