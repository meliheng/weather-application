import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherapp/core/constants/ui_constants.dart';
import 'package:weatherapp/core/extensions/context_extension.dart';

class SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  const SettingTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: UIConstants.mediumSpacing,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(UIConstants.defaultSpacing),
          ),
          child: ListTile(
            title: Text(title, style: context.textTheme.labelSmall),
            leading: FaIcon(icon, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
