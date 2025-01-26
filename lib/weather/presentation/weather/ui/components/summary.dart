import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherapp/core/constants/app_strings.dart';
import 'package:weatherapp/core/constants/ui_constants.dart';
import 'package:weatherapp/core/extensions/double_extension.dart';
import 'package:weatherapp/weather/domain/entity/weather_ui_model.dart';
import 'package:weatherapp/weather/presentation/weather/ui/components/extra_info_card.dart';

class Summary extends StatelessWidget {
  final WeatherUiModel weather;

  const Summary({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: UIConstants.defaultSpacing,
      ),
      child: Wrap(
        spacing: UIConstants.defaultSpacing,
        runSpacing: UIConstants.defaultSpacing,
        alignment: WrapAlignment.spaceEvenly,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          ExtraInfoCard(
            icon: FontAwesomeIcons.wind,
            title: AppStrings.wind,
            value: weather.windSpeed?.toKmPerHour ?? "0 km/h",
          ),
          ExtraInfoCard(
            icon: FontAwesomeIcons.droplet,
            title: AppStrings.humidity,
            value: "${weather.humidity?.percentageFormat}",
          ),
          ExtraInfoCard(
            icon: FontAwesomeIcons.cloudRain,
            title: AppStrings.rain,
            value: weather.rain?.roundFormat ?? "0",
          ),
          ExtraInfoCard(
            icon: FontAwesomeIcons.gauge,
            title: AppStrings.pressure,
            value: weather.pressure?.toPressureFormat ?? "0 hPa",
          ),
        ],
      ),
    );
  }
}
