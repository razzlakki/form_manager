import 'package:flutter/material.dart';
import 'package:my_form_admin/screens/splash_screen.dart';
import 'route_paths.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.SplashRoute:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    default:
      return MaterialPageRoute(builder: (context) => SplashScreen());
  }
}
