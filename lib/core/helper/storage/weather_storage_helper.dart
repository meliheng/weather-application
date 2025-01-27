import 'package:weatherapp/core/helper/storage/object_box/object_box_helper.dart';
import 'package:weatherapp/core/models/weather_model.dart';
import 'package:weatherapp/weather/domain/entity/weather_ui_model.dart';

class WeatherStorageHelper {
  WeatherStorageHelper._();
  static Future<void> saveWeather(WeatherUiModel weather, String city) async {
    final weatherModel = WeatherModel.fromUiModel(weather, city);

    // Clear old data for this city
    await ObjectBoxHelper.instance.clearData<WeatherModel>();
    await ObjectBoxHelper.instance.clearData<DailyWeatherModel>();

    // Save both weather and its daily data
    await ObjectBoxHelper.instance.saveData<WeatherModel>(weatherModel);
    for (var daily in weatherModel.daily) {
      await ObjectBoxHelper.instance.saveData<DailyWeatherModel>(daily);
    }
  }

  static Future<WeatherUiModel?> getLastWeather(String city) async {
    try {
      final weatherModels =
          await ObjectBoxHelper.instance.readData<WeatherModel>();
      final cityWeather =
          weatherModels.where((w) => w.city == city).toList()..sort(
            (a, b) => (b.lastUpdated ?? DateTime.now()).compareTo(
              a.lastUpdated ?? DateTime.now(),
            ),
          );

      if (cityWeather.isNotEmpty) {
        return cityWeather.first.toUiModel();
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
