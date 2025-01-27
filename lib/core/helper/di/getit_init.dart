import 'package:get_it/get_it.dart';
import 'package:weatherapp/location/data/data_source/city_remote_datasource.dart';
import 'package:weatherapp/location/data/repository/city_repository_impl.dart';
import 'package:weatherapp/location/domain/repository/i_city_repository.dart';
import 'package:weatherapp/location/domain/usecase/get_city_usecase.dart';
import 'package:weatherapp/weather/data/data_source/weather_remote_datasource.dart';
import 'package:weatherapp/weather/data/repository/weather_repository_impl.dart';
import 'package:weatherapp/weather/domain/repository/i_weather_repository.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<WeatherRemoteDatasource>(
    WeatherRemoteDataSourceImpl(),
  );
  getIt.registerSingleton<IWeatherRepository>(WeatherRepositoryImpl(getIt()));

  getIt.registerSingleton<CityRemoteDatasource>(CityRemoteDataSourceImpl());

  getIt.registerSingleton<ICityRepository>(CityRepositoryImpl(getIt()));
  getIt.registerSingleton<GetCityUsecase>(GetCityUsecase(getIt()));
}
