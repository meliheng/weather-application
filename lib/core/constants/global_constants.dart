final class GlobalConstants {
  GlobalConstants._();

  static bool isOffline = false;
  static bool get isDayTime {
    final now = DateTime.now();
    return now.hour >= 6 && now.hour < 18;
  }
}
