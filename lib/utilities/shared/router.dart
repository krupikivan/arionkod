import 'package:arion_code_challenge/views/city_detail_screen.dart';
import 'package:arion_code_challenge/views/home_screen.dart';
import 'package:arion_code_challenge/views/splash_screen.dart';
import 'package:flutter/material.dart';

import 'arion_page_transition.dart';
import 'route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case initialRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SplashScreen(),
      );
    case citiesRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeScreen(),
      );
    case cityDetailRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const CityDetailScreen(),
      );
    default:
      throw Exception('${settings.name} route not handled');
  }
}

ArionPageTransition _getPageRoute({
  String? routeName,
  Widget? viewToShow,
  bool fullScreenDialog = false,
  dynamic arguments,
}) {
  return ArionPageTransition(
    settings: RouteSettings(name: routeName, arguments: arguments),
    fullScreenDialog: fullScreenDialog,
    type: fullScreenDialog
        ? PageTransitionType.fade
        : PageTransitionType.rightToLeft,
    child: viewToShow!,
  );
}
