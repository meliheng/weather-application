import 'package:auto_route/auto_route.dart';
import 'package:weatherapp/core/router/app_router.gr.dart';

@AutoRouterConfig()
final class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: WeatherInfoRoute.page),
    AutoRoute(page: SettingRoute.page),
    AutoRoute(page: SearchCityRoute.page),
  ];
}
