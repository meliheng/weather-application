part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  final String city;
  const WeatherState({this.city = ''});

  @override
  List<Object?> get props => [city];
}

final class WeatherLoading extends WeatherState {
  const WeatherLoading({super.city});
}

final class WeatherLoaded extends WeatherState {
  final WeatherUiModel fullInfo;
  final String? weatherDescription;

  const WeatherLoaded({
    required this.fullInfo,
    this.weatherDescription,
    required super.city,
  });

  @override
  List<Object?> get props => [fullInfo, city, weatherDescription];

  WeatherLoaded copyWith({
    WeatherUiModel? fullInfo,
    String? weatherDescription,
    String? city,
  }) {
    return WeatherLoaded(
      fullInfo: fullInfo ?? this.fullInfo,
      weatherDescription: weatherDescription ?? this.weatherDescription,
      city: city ?? this.city,
    );
  }
}

final class WeatherError extends WeatherState {
  final String message;

  const WeatherError(this.message, {super.city});

  @override
  List<Object?> get props => [message, city];
}

final class WeatherUserMessage extends WeatherState {
  final String message;

  const WeatherUserMessage({super.city, required this.message});
  @override
  List<Object?> get props => [message, city];
}
