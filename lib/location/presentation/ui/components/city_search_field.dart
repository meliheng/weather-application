import 'package:flutter/material.dart';
import 'package:weatherapp/core/components/custom_search_field.dart';
import 'package:weatherapp/core/constants/app_strings.dart';
import 'package:weatherapp/core/extensions/context_extension.dart';
import 'package:weatherapp/location/presentation/bloc/city_bloc.dart';

class CitySearchField extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(65);

  const CitySearchField({super.key, required CityBloc cityBloc})
    : _cityBloc = cityBloc;

  final CityBloc _cityBloc;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(65),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: CustomSearchField(
          hint: AppStrings.search,
          prefixIcon: Icon(
            Icons.search,
            color: context.theme.colorScheme.primary,
          ),
          onChanged: (value) {
            if (value.length > 2) {
              _cityBloc.add(CitySearchEvent(query: value, page: null));
            }
          },
        ),
      ),
    );
  }
}
