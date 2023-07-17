import 'dart:async';

import '../../utils/constants/time_class.dart';

class AppServices {
  AppServices._();

  static Future<bool> isNightTime() async {
    DateTime currentTime = DateTime.now();
    DateTime sunsetTime = DateTime(
      currentTime.year,
      currentTime.month,
      currentTime.day,
      Setting.sunsetTime.hour,
      Setting.sunsetTime.minute,
    );
    DateTime sunriseTime = DateTime(
      currentTime.year,
      currentTime.month,
      currentTime.day,
      Setting.sunriseTime.hour,
      Setting.sunriseTime.minute,
    );

    if (currentTime.isAfter(sunsetTime) || currentTime.isBefore(sunriseTime)) {
      // It's night time
      return true;
    } else {
      // It's not night time
      return false;
    }
  }
}
