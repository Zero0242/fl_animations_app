import 'package:fl_animaciones/config/config.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = NotifierProvider<ThemeNotifier, bool>(() {
  return ThemeNotifier();
});

class ThemeNotifier extends Notifier<bool> {
  ThemeNotifier() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _initialize();
    });
  }
  SharedPreferencesAsync get _store => SharedPreferencesAsync();

  @override
  bool build() {
    return true;
  }

  void _initialize() async {
    final storedValue = await _store.getBool(StorageKeys.theme);
    state = storedValue ?? true;
  }

  void setDark() {
    state = true;
    _store.setBool(StorageKeys.theme, state);
  }

  void setLight() {
    state = false;
    _store.setBool(StorageKeys.theme, state);
  }

  void toggle() {
    state ? setLight() : setDark();
  }
}
