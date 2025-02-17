import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherapp/core/constants/ui_constants.dart';
import 'package:weatherapp/core/extensions/context_extension.dart';

class CityTile extends StatelessWidget {
  final VoidCallback onTap;
  final String? city;
  const CityTile({super.key, required this.onTap, required this.city});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: UIConstants.defaultSpacing,
        vertical: UIConstants.smallSpacing,
      ),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(UIConstants.defaultSpacing),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(UIConstants.mediumSpacing),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(
                      UIConstants.mediumSpacing,
                    ),
                  ),
                  child: Icon(
                    FontAwesomeIcons.locationDot,
                    color: context.colorScheme.primary,
                    size: 16,
                  ),
                ),
                const SizedBox(width: UIConstants.defaultSpacing),
                Expanded(
                  child: Text(
                    city ?? "",
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(Icons.chevron_right, color: context.colorScheme.primary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
