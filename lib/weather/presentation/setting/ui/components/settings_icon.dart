import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherapp/core/components/custom_icon_button.dart';
import 'package:weatherapp/core/router/app_router.gr.dart';

class SettingsIcon extends StatelessWidget {
  const SettingsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      onTap: () {
        context.router.push(const SettingRoute());
      },
      icon: FontAwesomeIcons.gear,
    );
  }
}
