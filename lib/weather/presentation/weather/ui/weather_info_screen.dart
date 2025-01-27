import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/core/components/custom_snackbar.dart';
import 'package:weatherapp/core/components/error_widget.dart';
import 'package:weatherapp/core/constants/app_strings.dart';
import 'package:weatherapp/core/constants/ui_constants.dart';
import 'package:weatherapp/core/mixin/theme_animation_mixin.dart';
import 'package:weatherapp/weather/presentation/weather/bloc/weather_bloc.dart';
import 'package:weatherapp/weather/presentation/weather/ui/components/header_widget.dart';
import 'package:weatherapp/weather/presentation/weather/ui/components/summary.dart';
import 'package:weatherapp/weather/presentation/weather/ui/components/today_info_widget.dart';
import 'package:weatherapp/weather/presentation/weather/ui/components/weekly/weekly_card.dart';

@RoutePage()
class WeatherInfoScreen extends StatefulWidget {
  const WeatherInfoScreen({super.key});

  @override
  State<WeatherInfoScreen> createState() => _WeatherInfoScreenState();
}

class _WeatherInfoScreenState extends State<WeatherInfoScreen>
    with TickerProviderStateMixin, ThemeAnimationMixin {
  final WeatherBloc _weatherBloc = WeatherBloc();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: colorAnimation,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: BlocConsumer<WeatherBloc, WeatherState>(
            bloc: _weatherBloc,
            listenWhen: (previous, current) => current is WeatherUserMessage,
            buildWhen: (previous, current) => current is! WeatherUserMessage,
            listener: (context, state) {
              if (state is WeatherUserMessage) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(CustomSnackbar.build(context, state.message));
              }
            },
            builder: (context, state) {
              if (state is WeatherLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is WeatherError) {
                return CustomErrorWidget(
                  message: AppStrings.errorMessage,
                  buttonText: AppStrings.tryAgain,
                  onPressed: () {
                    _weatherBloc.add(FetchWeather());
                  },
                );
              } else if (state is WeatherLoaded) {
                return SafeArea(
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.all(
                          UIConstants.defaultSpacing,
                        ),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate([
                            HeaderWidget(
                              city: state.city,
                              weatherBloc: _weatherBloc,
                            ),
                            const SizedBox(height: UIConstants.defaultSpacing),
                            TodayInfoWidget(weather: state.fullInfo),
                            const SizedBox(height: UIConstants.defaultSpacing),
                            WeeklyCard(weather: state.fullInfo),
                            const SizedBox(height: UIConstants.defaultSpacing),
                            Summary(weather: state.fullInfo),
                          ]),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return CustomErrorWidget(
                  message: AppStrings.errorMessage,
                  buttonText: AppStrings.tryAgain,
                  onPressed: () {
                    _weatherBloc.add(FetchWeather());
                  },
                );
              }
            },
          ),
        );
      },
    );
  }
}
