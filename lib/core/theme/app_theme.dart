import 'package:flutter/material.dart';

final class AppTheme {
  AppTheme._();

  static bool isDayTime() {
    final now = DateTime.now();
    return now.hour >= 6 && now.hour < 18;
  }

  static const primaryOrange = Colors.orange;
  static const darkBlue = Color(0xFF1A237E);
  static const lightBlue = Color(0xFF4A90E2);
  static ThemeData get theme {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        bodySmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        labelSmall: TextStyle(fontSize: 14),
        labelMedium: TextStyle(fontSize: 16),
      ).apply(bodyColor: Colors.white, displayColor: Colors.white),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
