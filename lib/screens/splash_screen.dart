import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_form_admin/custom_ui/my_farm_scaffold.dart';
import 'package:my_form_admin/services/di/locator.dart';
import 'package:my_form_admin/services/navigationservice/navigation_services.dart';
import 'package:my_form_admin/services/navigationservice/route_paths.dart';
import 'package:my_form_admin/theme/color_config.dart';
import 'package:my_form_admin/util/data_util.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  NavigationService _navigationService = locator<NavigationService>();

  void _navigateToOtherScreen() async {
    DataUtil.get().getCustomerId(customer: (customerID) {
      print('CUSTMER ID ==> $customerID');
      if (customerID != null && customerID != '') {
        // new Future.delayed(const Duration(seconds: 3), () {
        _navigationService.navigateTo(Routes.DashboardRoute);
        // });
      } else {
        Future.delayed(const Duration(milliseconds: 500), () {
          _navigationService.navigateTo(Routes.LoginRoute);
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _navigateToOtherScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MyFarmScaffold(
      bgcolor: ColorConfig.color_bg,
      child: Center(
        child: Image.asset(
          'assets/images/splash_icon.png',
          height: 250,
          width: 250,
        ),
      ),
    );
  }
}
