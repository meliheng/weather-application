import 'package:flutter/material.dart';
import 'package:weatherapp/core/components/custom_divider.dart';
import 'package:weatherapp/weather/domain/entity/weather_ui_model.dart';
import 'package:weatherapp/weather/presentation/weather/ui/components/weekly/weekly_list_view.dart';

class WeeklyCard extends StatelessWidget {
  final WeatherUiModel weather;
  const WeeklyCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomDivider(),
        WeeklyListView(weather: weather),
        CustomDivider(),
      ],
    );
  }
}
