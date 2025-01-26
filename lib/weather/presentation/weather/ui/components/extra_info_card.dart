import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherapp/core/extensions/context_extension.dart';
import 'package:weatherapp/weather/presentation/weather/ui/components/circular_card.dart';

class ExtraInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  const ExtraInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        CircularCard(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(icon, color: Colors.white, size: 15),
                SizedBox(width: 5),
                Text(title, style: context.textTheme.labelMedium),
              ],
            ),
          ),
        ),
        Text(value, style: context.textTheme.bodyLarge),
      ],
    );
  }
}
