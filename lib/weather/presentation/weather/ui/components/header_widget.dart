import 'package:flutter/material.dart';
import 'package:weatherapp/core/constants/app_strings.dart';
import 'package:weatherapp/core/constants/global_constants.dart';
import 'package:weatherapp/core/extensions/context_extension.dart';
import 'package:weatherapp/core/helper/date/date_helper.dart';
import 'package:weatherapp/weather/presentation/setting/ui/components/settings_icon.dart';
import 'package:weatherapp/weather/presentation/weather/bloc/weather_bloc.dart';
import 'package:weatherapp/weather/presentation/weather/ui/components/refresh_icon.dart';

class HeaderWidget extends StatelessWidget {
  final String city;
  final WeatherBloc weatherBloc;
  const HeaderWidget({
    super.key,
    required this.city,
    required this.weatherBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateHelper.getCurrentTime, style: context.textTheme.bodyLarge),
            Text(city, style: context.textTheme.bodyLarge),
            Container(
              height: 2,
              width: MediaQuery.sizeOf(context).width * 0.4,
              color: Colors.white,
            ),
            Text(
              "${AppStrings.today} ${DateHelper.getCurrentDate}",
              style: context.textTheme.bodySmall,
            ),
          ],
        ),
        if (GlobalConstants.isOffline)
          RefreshIcon(
            onTap: () {
              weatherBloc.add(FetchWeather());
            },
          )
        else
          SettingsIcon(),
      ],
    );
  }
}
