import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weatherapp/core/helper/di/getit_init.dart';
import 'package:weatherapp/core/helper/storage/object_box/object_box_helper.dart';
import 'package:weatherapp/core/router/app_router.dart';
import 'package:weatherapp/core/services/background_service.dart';
import 'package:weatherapp/core/services/notification_service.dart';
import 'package:weatherapp/core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize();
  setUp();
  runApp(MainApp());
}

Future<void> initialize() async {
  await dotenv.load(fileName: ".env");

  // Initialize ObjectBox
  await ObjectBoxHelper.instance.store;

  await NotificationService.instance.initialize();

  // Initialize background service
  await BackgroundService.initialize();
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      routerConfig: _appRouter.config(),
    );
  }
}
