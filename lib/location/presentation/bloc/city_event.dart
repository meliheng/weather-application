part of 'city_bloc.dart';

sealed class CityEvent extends Equatable {
  const CityEvent();

  @override
  List<Object?> get props => [];
}

final class CitySearchEvent extends CityEvent {
  final String query;
  final int? page;

  const CitySearchEvent({required this.query, required this.page});

  @override
  List<Object?> get props => [query, page];
}

final class CitySelectEvent extends CityEvent {
  final String city;

  const CitySelectEvent({required this.city});

  @override
  List<Object?> get props => [city];
}
