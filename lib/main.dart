import 'package:flutter/material.dart';
import 'package:my_form_admin/services/di/locator.dart';
import 'package:my_form_admin/services/navigationservice/navigation_services.dart';
import 'package:my_form_admin/services/navigationservice/route_paths.dart';
import 'package:my_form_admin/theme/app_theme.dart';
import 'package:provider/provider.dart';
import './services/navigationservice/router.dart' as router;

void main() {
  setupLocator();
  runApp(MyFarmApp());
}

class MyFarmApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
        initialRoute: Routes.SplashRoute,
        title: 'My Farm',
        theme: AppTheme.getAppTheme(context: context),
      ),
    );
  }
}
