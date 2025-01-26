import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/core/constants/app_strings.dart';
import 'package:weatherapp/core/constants/global_constants.dart';
import 'package:weatherapp/core/helper/storage/user_location_storage_helper.dart';
import 'package:weatherapp/core/services/background_service.dart';
import 'package:weatherapp/weather/domain/entity/weather_ui_model.dart';
import 'package:weatherapp/weather/domain/usecase/get_weather_full_info_usecase.dart';
import 'package:weatherapp/weather/domain/usecase/get_weather_overview_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherFullInfoUsecase getWeatherFullInfo;
  final GetWeatherOverviewUsecase getWeatherOverview;

  WeatherBloc(this.getWeatherFullInfo, this.getWeatherOverview)
    : super(const WeatherLoading()) {
    on<FetchWeather>(_onFetchWeather);
    on<InitializeWeather>(_onInitializeWeather);

    add(InitializeWeather());
  }

  FutureOr<void> _onInitializeWeather(
    InitializeWeather event,
    Emitter<WeatherState> emit,
  ) async {
    final cityName = await UserLocationStorageHelper.getCity();
    emit(WeatherLoading(city: cityName));

    // Register background task for weather alerts
    await BackgroundService.registerPeriodicTask(cityName);

    add(FetchWeather());
  }

  FutureOr<void> _onFetchWeather(
    FetchWeather event,
    Emitter<WeatherState> emit,
  ) async {
    final result = await getWeatherFullInfo.execute();
    if (result.error != null) {
      emit(WeatherError(result.error!.message, city: state.city));
      return;
    } else if (result.data != null) {
      final overviewResult = await getWeatherOverview.execute(state.city);
      final description =
          overviewResult.data ?? 'Weather information unavailable';
      if (GlobalConstants.isOffline) {
        emit(
          WeatherUserMessage(
            city: state.city,
            message: AppStrings.networkError,
          ),
        );
      }
      emit(
        WeatherLoaded(
          fullInfo: result.data!,
          weatherDescription: description,
          city: state.city,
        ),
      );
    }
  }
}
