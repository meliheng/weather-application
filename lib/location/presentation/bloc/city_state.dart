part of 'city_bloc.dart';

sealed class CityState extends Equatable {
  const CityState();

  @override
  List<Object> get props => [];
}

sealed class CityActionState extends CityState {
  @override
  List<Object> get props => [];
}

final class CityInitial extends CityState {}

final class CityLoading extends CityState {}

final class CityLoaded extends CityState {
  final CityUiModel cityUiModel;

  const CityLoaded({required this.cityUiModel});

  @override
  List<Object> get props => [cityUiModel];
}

final class CityError extends CityState {
  final String message;

  const CityError({required this.message});

  @override
  List<Object> get props => [message];
}

final class CitySaved extends CityActionState {
  @override
  List<Object> get props => [identityHashCode(this)];
}
