import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instancia = Preferences._internal();

  factory Preferences() => _instancia;

  Preferences._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool get darkMode => _prefs.getBool('darkMode') ?? false;
  set darkMode(bool value) => _prefs.setBool('darkMode', value);
}
