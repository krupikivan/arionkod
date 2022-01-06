import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'utilities/preferences.dart';
import 'utilities/shared/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = Preferences();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await setupLocator();
  await prefs.initPrefs();
  runApp(const App());
}
