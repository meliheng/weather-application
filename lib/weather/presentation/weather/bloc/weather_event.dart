part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

final class InitializeWeather extends WeatherEvent {}

final class FetchWeather extends WeatherEvent {}
