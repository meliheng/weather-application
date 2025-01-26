import 'package:flutter/material.dart';
import 'package:weatherapp/core/extensions/context_extension.dart';
import 'package:weatherapp/core/extensions/double_extension.dart';
import 'package:weatherapp/core/extensions/string_extension.dart';
import 'package:weatherapp/weather/domain/entity/weather_ui_model.dart';

class WeeklyListItem extends StatelessWidget {
  const WeeklyListItem({
    super.key,
    required this.itemWidth,
    required this.daily,
  });

  final double itemWidth;
  final WeatherDailyUiModel? daily;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: itemWidth,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            daily?.date?.toWeekDayName() ?? "",
            style: context.textTheme.labelSmall,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(height: 4),
          Text(
            daily?.dayTemperature?.temperatureFormat ?? "",
            style: context.textTheme.bodyLarge,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
