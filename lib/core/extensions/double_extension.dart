extension DoubleExtension on double {
  String get temperatureFormat {
    return "${round()}\u00B0";
  }

  /// Converts meters per second to kilometers per hour
  String get toKmPerHour {
    // Formula: km/h = (m/s) * (3600/1000)
    final kmPerHour = this * 3.6;
    return "${kmPerHour.toStringAsFixed(0)} km/h";
  }

  String get toPressureFormat {
    return "${round()} hpa";
  }

  String get percentageFormat {
    return "${round()}%";
  }

  String get roundFormat {
    return round().toString();
  }
}
