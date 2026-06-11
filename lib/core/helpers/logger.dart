import 'dart:developer';

import 'package:flutter/foundation.dart';

class AppLogger {
  AppLogger._();
  static void logData(String message) {
    if (!kReleaseMode) {
      log(message);
    }
  }
}
