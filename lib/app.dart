import 'package:arion_code_challenge/providers/citiies_provider.dart';
import 'package:arion_code_challenge/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utilities/shared/locator.dart';
import 'utilities/shared/route_names.dart';
import 'utilities/shared/router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static final GlobalKey<NavigatorState> navigationKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => locator<ThemeProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => locator<CitiesProvider>(),
        )
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, _) => MaterialApp(
          title: 'Arion Code Challenge',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: generateRoute,
          theme: value.themeData,
          navigatorKey: navigationKey,
          initialRoute: initialRoute,
        ),
      ),
    );
  }
}
