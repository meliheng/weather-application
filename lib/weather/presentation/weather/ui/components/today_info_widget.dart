import 'package:flutter/material.dart';
import 'package:weatherapp/core/constants/app_strings.dart';
import 'package:weatherapp/core/extensions/context_extension.dart';
import 'package:weatherapp/core/extensions/double_extension.dart';
import 'package:weatherapp/weather/domain/entity/weather_ui_model.dart';
import 'package:weatherapp/weather/presentation/weather/ui/components/circular_card.dart';
import 'package:weatherapp/weather/presentation/weather/ui/components/uv_widget.dart';

class TodayInfoWidget extends StatelessWidget {
  final WeatherUiModel weather;

  const TodayInfoWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          weather.temperature?.temperatureFormat ?? "",
          style: context.textTheme.displayLarge,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.6,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  weather.description ?? "",
                  style: context.textTheme.displayLarge,
                ),
              ),
              CircularCard(
                child: Row(
                  children: [
                    Text(
                      "${AppStrings.uv}: ",
                      style: context.textTheme.labelSmall,
                    ),
                    UvWidget(uvIndex: weather.uvIndex ?? 0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
