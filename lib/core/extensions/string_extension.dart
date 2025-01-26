import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  String toWeekDayName() {
    try {
      final date = DateTime.parse(this);
      final now = DateTime.now();
      final tomorrow = DateTime.now().add(const Duration(days: 1));
      
      if (DateUtils.isSameDay(date, now)) {
        return 'Today';
      } else if (DateUtils.isSameDay(date, tomorrow)) {
        return 'Tomorrow';
      } else {
        return DateFormat('EEE').format(date); // Returns Wed, Thu, etc.
      }
    } catch (e) {
      return '';
    }
  }
}
