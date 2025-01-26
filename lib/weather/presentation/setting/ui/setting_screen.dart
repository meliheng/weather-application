import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherapp/core/constants/app_strings.dart';
import 'package:weatherapp/core/mixin/theme_animation_mixin.dart';
import 'package:weatherapp/core/router/app_router.gr.dart';
import 'package:weatherapp/weather/presentation/setting/ui/components/setting_tile.dart';

@RoutePage()
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    with TickerProviderStateMixin, ThemeAnimationMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: colorAnimation,
      builder:
          (context, child) => Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(title: Text(AppStrings.settings)),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.general),
                  SettingTile(
                    icon: FontAwesomeIcons.locationDot,
                    title: AppStrings.changeCity,
                    onTap: () {
                      context.router.push(const SearchCityRoute());
                    },
                  ),
                  Text(AppStrings.support),
                  SettingTile(
                    icon: FontAwesomeIcons.paste,
                    title: AppStrings.termOfUse,
                  ),
                  SettingTile(
                    icon: FontAwesomeIcons.shieldHalved,
                    title: AppStrings.privacyPolicy,
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
