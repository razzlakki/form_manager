import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_form_admin/custom_ui/my_farm_scaffold.dart';
import 'package:my_form_admin/services/di/locator.dart';
import 'package:my_form_admin/services/navigationservice/navigation_services.dart';
import 'package:my_form_admin/services/navigationservice/route_paths.dart';
import 'package:my_form_admin/theme/color_config.dart';
import 'package:my_form_admin/util/Constants.dart';
import 'package:my_form_admin/util/data_util.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  NavigationService _navigationService = locator<NavigationService>();

  void _navigateToOtherScreen() async {
    DataUtil.get().getUserName(
        key: Constants.ROLE,
        username: (role) {
          print('role  ==> $role');
          String route = (role != null && role != '')
              ? role != 'Distributor'
                  ? Routes.DashboardRoute
                  : Routes.OrdersRoute
              : Routes.LoginRoute;
          print(route);

          new Future.delayed(const Duration(milliseconds: 1500), () {
            _navigationService.navigateTo(route);
          });
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
