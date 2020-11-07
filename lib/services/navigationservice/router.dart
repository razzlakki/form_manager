import 'package:flutter/material.dart';
import 'package:my_form_admin/screens/dashboard_screen.dart';
import 'package:my_form_admin/screens/login_screen.dart';
import 'package:my_form_admin/screens/orders_screen.dart';
import 'package:my_form_admin/screens/productlist_screen.dart';
import 'package:my_form_admin/screens/splash_screen.dart';
import 'route_paths.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.SplashRoute:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case Routes.LoginRoute:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case Routes.DashboardRoute:
      return MaterialPageRoute(builder: (context) => DashboardScreen());
    case Routes.OrdersRoute:
      return MaterialPageRoute(builder: (context) => OrdersScreen());
      case Routes.Products:
      return MaterialPageRoute(builder: (context) => ProductListScreen());
    default:
      return MaterialPageRoute(builder: (context) => SplashScreen());
  }
}
