// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:weatherapp/location/presentation/ui/search_city_screen.dart'
    as _i1;
import 'package:weatherapp/weather/presentation/setting/ui/setting_screen.dart'
    as _i2;
import 'package:weatherapp/weather/presentation/splash_screen.dart' as _i3;
import 'package:weatherapp/weather/presentation/weather/ui/weather_info_screen.dart'
    as _i4;

/// generated route for
/// [_i1.SearcCityScreen]
class SearchCityRoute extends _i5.PageRouteInfo<void> {
  const SearchCityRoute({List<_i5.PageRouteInfo>? children})
    : super(SearchCityRoute.name, initialChildren: children);

  static const String name = 'SearcCityRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.SearcCityScreen();
    },
  );
}

/// generated route for
/// [_i2.SettingScreen]
class SettingRoute extends _i5.PageRouteInfo<void> {
  const SettingRoute({List<_i5.PageRouteInfo>? children})
    : super(SettingRoute.name, initialChildren: children);

  static const String name = 'SettingRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.SettingScreen();
    },
  );
}

/// generated route for
/// [_i3.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.SplashScreen();
    },
  );
}

/// generated route for
/// [_i4.WeatherInfoScreen]
class WeatherInfoRoute extends _i5.PageRouteInfo<void> {
  const WeatherInfoRoute({List<_i5.PageRouteInfo>? children})
    : super(WeatherInfoRoute.name, initialChildren: children);

  static const String name = 'WeatherInfoRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.WeatherInfoScreen();
    },
  );
}
