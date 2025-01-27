import 'package:flutter/material.dart';
import 'package:weatherapp/core/constants/ui_constants.dart';
import 'package:weatherapp/weather/domain/entity/weather_ui_model.dart';
import 'package:weatherapp/weather/presentation/weather/ui/components/weekly/weekly_list_item.dart';

class WeeklyListView extends StatelessWidget {
  final WeatherUiModel weather;

  const WeeklyListView({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;

    // Calculate fixed heights based on device size
    final listViewHeight = isLandscape ? 60.0 : 70.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth =
            isLandscape
                ? constraints.maxWidth *
                    0.15 // Smaller width in landscape
                : constraints.maxWidth * 0.2; // Normal width in portrait

        return Container(
          height: listViewHeight,
          margin: const EdgeInsets.only(bottom: UIConstants.mediumSpacing),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: UIConstants.mediumSpacing,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: weather.daily?.length ?? 0,
            itemBuilder: (context, index) {
              final daily = weather.daily?[index];
              return WeeklyListItem(itemWidth: itemWidth, daily: daily);
            },
          ),
        );
      },
    );
  }
}
