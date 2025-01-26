import 'package:intl/intl.dart';

final class DateHelper {
  DateHelper._();

  static String get getCurrentTime {
    return DateFormat('HH:mm').format(DateTime.now());
  }

  static String get getCurrentDate {
    return DateFormat('dd.MM.yyyy').format(DateTime.now());
  }
}
