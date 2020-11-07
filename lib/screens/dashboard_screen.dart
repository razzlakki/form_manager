import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_form_admin/custom_ui/my_farm_app_bar.dart';
import 'package:my_form_admin/custom_ui/my_farm_scaffold.dart';
import 'package:my_form_admin/services/di/locator.dart';
import 'package:my_form_admin/services/navigationservice/navigation_services.dart';
import 'package:my_form_admin/services/navigationservice/route_paths.dart';
import 'package:my_form_admin/theme/color_config.dart';
import 'package:my_form_admin/theme/theme_constants.dart';
import 'package:my_form_admin/util/shared_pref_utility.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyFarmScaffold(
      appbar: MyFarmAppBar.getCustomAppBar(actions: [
        InkWell(
            onTap: () {
              SharedPrefUtility().removeAll();
              locator<NavigationService>().navigateTo(Routes.LoginRoute);
            },
            child: Icon(Icons.logout))
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                //  _settingModalBottomSheet(context);
                locator<NavigationService>().goTo(Routes.OrdersRoute);
                print('Orders');
              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: ColorConfig.color_danger,
                  boxShadow: [kDefaultShadow],
                ),
                height: 50,
                child: Container(
                  margin: EdgeInsets.only(left: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: EdgeInsets.all(6),
                  child: Center(
                      child: Text(
                    'Orders',
                    style: TextStyle(
                        color: ColorConfig.color_bg,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
                ),
              )),
          InkWell(
              onTap: () {
                //  _settingModalBottomSheet(context);
                print('Products');
                locator<NavigationService>().goTo(Routes.Products);
              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: ColorConfig.color_danger,
                  boxShadow: [kDefaultShadow],
                ),
                height: 50,
                child: Container(
                  margin: EdgeInsets.only(left: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: EdgeInsets.all(6),
                  child: Center(
                      child: Text(
                    'Products',
                    style: TextStyle(
                        color: ColorConfig.color_bg,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
                ),
              ))
        ],
      ),
    );
  }
}
