import 'package:arion_code_challenge/utilities/preferences.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _darkMode = false;
  final _prefs = Preferences();
  final _darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: Colors.black,
  );
  final _lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: Colors.white,
  );

  ThemeData? _themeData;
  ThemeData get themeData =>
      _themeData ?? (_prefs.darkMode ? _darkTheme : _lightTheme);

  setDarkMode() {
    _darkMode = !_darkMode;
    _themeData = _darkMode ? _darkTheme : _lightTheme;
    _prefs.darkMode = _darkMode;
    notifyListeners();
  }
}
