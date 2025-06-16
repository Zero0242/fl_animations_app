import 'package:flutter/services.dart';

class StatusBarUtils {
  static void setLight() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  static void setDark() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }
}
