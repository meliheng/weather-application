import 'package:workmanager/workmanager.dart';
import 'package:flutter/foundation.dart';
import 'dart:io' show Platform;

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    try {
      switch (taskName) {
        case 'checkWeatherAlerts':
          final place = inputData?['place'] as String?;
          if (place != null) {
            print("-------------$place");
            // await NotificationService.instance.checkAndShowWeatherAlerts(place);
          }
      }
      return true;
    } catch (e) {
      debugPrint('Background task failed: $e');
      return false;
    }
  });
}

class BackgroundService {
  static bool _isInitialized = false;

  static Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      if (Platform.isIOS && !Platform.environment.containsKey('FLUTTER_TEST')) {
        debugPrint('Initializing background service for iOS...');
        await Workmanager().initialize(
          callbackDispatcher,
          isInDebugMode: kDebugMode,
        );
      } else if (Platform.isAndroid) {
        debugPrint('Initializing background service for Android...');
        await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
      } else {
        debugPrint(
          'Background service not supported on this platform or environment',
        );
        return;
      }
      _isInitialized = true;
      debugPrint('Background service initialized successfully');
    } catch (e) {
      debugPrint('Failed to initialize background service: $e');
    }
  }

  static Future<void> registerPeriodicTask(String place) async {
    if (!_isInitialized) {
      debugPrint(
        'Background service not initialized. Skipping task registration.',
      );
      return;
    }

    try {
      if (Platform.isIOS && !Platform.environment.containsKey('FLUTTER_TEST')) {
        debugPrint('Registering periodic task for iOS...');
        await _registerTask(place);
      } else if (Platform.isAndroid) {
        debugPrint('Registering periodic task for Android...');
        await _registerTask(place);
      } else {
        debugPrint(
          'Periodic tasks not supported on this platform or environment',
        );
      }
    } catch (e) {
      debugPrint('Failed to register periodic task: $e');
    }
  }

  static Future<void> _registerTask(String place) async {
    await Workmanager().registerPeriodicTask(
      'weatherAlerts',
      'checkWeatherAlerts',
      frequency: const Duration(minutes: 15),
      initialDelay: const Duration(seconds: 10),
      inputData: {'place': place},
      existingWorkPolicy: ExistingWorkPolicy.replace,
      constraints: Constraints(
        networkType: NetworkType.connected,
        requiresBatteryNotLow: true,
      ),
    );
  }

  static Future<void> cancelTask() async {
    try {
      await Workmanager().cancelAll();
      debugPrint('All background tasks cancelled');
    } catch (e) {
      debugPrint('Failed to cancel background tasks: $e');
    }
  }
}
