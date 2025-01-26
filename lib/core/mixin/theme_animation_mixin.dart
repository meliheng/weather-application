import 'package:flutter/material.dart';
import 'package:weatherapp/core/constants/global_constants.dart';
import 'package:weatherapp/core/theme/app_theme.dart';

mixin ThemeAnimationMixin<T extends StatefulWidget>
    on State<T>, TickerProviderStateMixin<T> {
  late AnimationController themeController;
  late Animation<Color?> colorAnimation;
  bool isDayTime = true;

  @override
  void initState() {
    super.initState();
    initThemeAnimation();
  }

  void initThemeAnimation() {
    isDayTime = GlobalConstants.isDayTime;
    themeController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    colorAnimation = ColorTween(
      begin: isDayTime ? AppTheme.darkBlue : AppTheme.lightBlue,
      end: isDayTime ? AppTheme.lightBlue : AppTheme.darkBlue,
    ).animate(themeController);

    themeController.forward();
  }

  @override
  void dispose() {
    themeController.dispose();
    super.dispose();
  }

  Color get backgroundColor =>
      colorAnimation.value ??
      (isDayTime ? AppTheme.darkBlue : AppTheme.lightBlue);
}
