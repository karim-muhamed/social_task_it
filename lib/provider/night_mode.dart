// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NightMode extends ChangeNotifier {
  ThemeData themeMode = ThemeData.light();
  bool _isEnabled = false;
  set UserthemeMode(ThemeData themedata) {
    themeMode = themedata;
    notifyListeners();
  }

  getTheme() {
    var themevalue;
    SharedPreferences.getInstance().then((v) {
      themevalue = v.getBool("night_mode_enabled");
    }).then((_) {
      if (themevalue) {
        themeMode = ThemeData.dark();
        notifyListeners();
        _isEnabled = true;
      }
    });

    return themeMode;
  }

  set Enabled(value) {
    _isEnabled = value;
    SharedPreferences.getInstance().then((v) {
      v.setBool("night_mode_enabled", _isEnabled);
    });
  }

  getEnabled() {
    return _isEnabled;
  }
}
