import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherapp/core/components/custom_icon_button.dart';

class RefreshIcon extends StatelessWidget {
  final VoidCallback onTap;
  const RefreshIcon({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(onTap: onTap, icon: FontAwesomeIcons.arrowsRotate);
  }
}
