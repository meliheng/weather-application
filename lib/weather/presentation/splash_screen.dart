import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/core/router/app_router.gr.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/lottie/splash.json', fit: BoxFit.cover),
    );
  }

  Future<Timer> loadSplash() async {
    return Timer(const Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() {
    context.router.replace(const WeatherInfoRoute());
  }
}
