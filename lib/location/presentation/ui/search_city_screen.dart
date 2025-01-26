import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/core/constants/app_strings.dart';
import 'package:weatherapp/core/helper/di/getit_init.dart';
import 'package:weatherapp/core/mixin/theme_animation_mixin.dart';
import 'package:weatherapp/core/router/app_router.gr.dart';
import 'package:weatherapp/location/presentation/bloc/city_bloc.dart';
import 'package:weatherapp/location/presentation/ui/components/city_list_view.dart';
import 'package:weatherapp/location/presentation/ui/components/city_search_error_widget.dart';
import 'package:weatherapp/location/presentation/ui/components/city_search_field.dart';

@RoutePage()
class SearcCityScreen extends StatefulWidget {
  const SearcCityScreen({super.key});

  @override
  State<SearcCityScreen> createState() => _SearcCityScreenState();
}

class _SearcCityScreenState extends State<SearcCityScreen>
    with TickerProviderStateMixin, ThemeAnimationMixin {
  final CityBloc _cityBloc = CityBloc(getIt());
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
      builder:
          (context, child) => Scaffold(
            backgroundColor: backgroundColor,
            body: SafeArea(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    floating: true,
                    snap: true,
                    title: Text(AppStrings.searchCity),
                    bottom: CitySearchField(cityBloc: _cityBloc),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 8),
                    sliver: BlocConsumer<CityBloc, CityState>(
                      bloc: _cityBloc,
                      buildWhen:
                          (previous, current) => current is! CityActionState,
                      listenWhen:
                          (previous, current) => current is CityActionState,
                      builder: (context, state) {
                        if (state is CityLoading) {
                          return const SliverFillRemaining(
                            child: Center(child: CircularProgressIndicator()),
                          );
                        } else if (state is CityLoaded) {
                          if (state.cityUiModel.cities == null ||
                              state.cityUiModel.cities!.isEmpty) {
                            return SliverFillRemaining(
                              child: CitySearchErrorWidget(
                                message: AppStrings.noCitiesFound,
                              ),
                            );
                          } else {
                            return CityListView(
                              cityBloc: _cityBloc,
                              cities: state.cityUiModel.cities ?? [],
                            );
                          }
                        } else if (state is CityError) {
                          return SliverFillRemaining(
                            child: CitySearchErrorWidget(
                              message: state.message,
                            ),
                          );
                        } else {
                          return SliverFillRemaining(
                            child: CitySearchErrorWidget(
                              message: AppStrings.searchCity,
                              icon: Icons.location_city,
                            ),
                          );
                        }
                      },
                      listener: (context, state) {
                        if (state is CitySaved) {
                          context.router.pushAndPopUntil(
                            WeatherInfoRoute(),
                            predicate: (route) => false,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
