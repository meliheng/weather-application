// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:weatherapp/core/helper/di/getit_init.dart';
// import 'package:weatherapp/core/model/data_state.dart';
// import 'package:weatherapp/domain/entity/weather_alert_ui_model.dart';
// import 'package:weatherapp/domain/usecase/get_weather_alert_usecase.dart';

// class NotificationService {
//   static final NotificationService _instance = NotificationService._();
//   static NotificationService get instance => _instance;

//   final FlutterLocalNotificationsPlugin _notifications =
//       FlutterLocalNotificationsPlugin();

//   NotificationService._();

//   Future<void> initialize() async {
//     const androidSettings = AndroidInitializationSettings(
//       '@mipmap/ic_launcher',
//     );
//     const iosSettings = DarwinInitializationSettings(
//       requestSoundPermission: true,
//       requestBadgePermission: true,
//       requestAlertPermission: true,
//     );

//     const settings = InitializationSettings(
//       android: androidSettings,
//       iOS: iosSettings,
//     );
//     await _notifications.initialize(settings);
//   }

//   Future<void> checkAndShowWeatherAlerts(String place) async {
//     try {
//       final response = await fetchWeatherAlerts(place);
//       if (response?.alerts.isNotEmpty ?? false) {
//         for (final alert in response!.alerts) {
//           await showNotification(title: alert.title, body: alert.description);
//         }
//       }
//     } catch (e) {
//       print('Error checking weather alerts: $e');
//     }
//   }

//   Future<WeatherAlertUiModel?> fetchWeatherAlerts(String place) async {
//     final response = await GetWeatherAlertUsecase(getIt()).execute(place);

//     if (response is DataSuccess) {
//       return response.data;
//     }
//     return null;
//   }

//   Future<void> showNotification({
//     required String title,
//     required String body,
//     int id = 0,
//   }) async {
//     const androidDetails = AndroidNotificationDetails(
//       'weather_alerts',
//       'Weather Alerts',
//       channelDescription: 'Important weather alerts and warnings',
//       importance: Importance.high,
//       priority: Priority.high,
//     );

//     const iosDetails = DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//     );

//     const details = NotificationDetails(
//       android: androidDetails,
//       iOS: iosDetails,
//     );

//     await _notifications.show(id, title, body, details);
//   }
// }
