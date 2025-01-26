import 'package:flutter/material.dart';
import 'package:weatherapp/location/presentation/bloc/city_bloc.dart';
import 'package:weatherapp/location/presentation/ui/components/city_tile.dart';

class CityListView extends StatelessWidget {
  const CityListView({
    super.key,
    required CityBloc cityBloc,
    required this.cities,
  }) : _cityBloc = cityBloc;

  final CityBloc _cityBloc;
  final List<String> cities;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return CityTile(
          onTap: () {
            _cityBloc.add(CitySelectEvent(city: cities[index]));
          },
          city: cities[index],
        );
      }, childCount: cities.length),
    );
  }
}
