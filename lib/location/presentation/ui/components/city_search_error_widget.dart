import 'package:flutter/material.dart';
import 'package:weatherapp/core/constants/ui_constants.dart';
import 'package:weatherapp/core/extensions/context_extension.dart';

class CitySearchErrorWidget extends StatelessWidget {
  final String message;
  final IconData? icon;
  const CitySearchErrorWidget({super.key, required this.message, this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon ?? Icons.error_outline, size: 64),
          const SizedBox(height: UIConstants.defaultSpacing),
          Text(message, style: context.textTheme.titleMedium),
        ],
      ),
    );
  }
}
