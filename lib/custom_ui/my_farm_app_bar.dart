import 'package:flutter/material.dart';
import 'package:my_form_admin/services/navigationservice/navigation_services.dart';
import 'package:my_form_admin/services/navigationservice/route_paths.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../services/di/locator.dart';
import '../theme/color_config.dart';

class MyFarmAppBar {
  static getCustomAppBar(
      {String title, Color color, List<Widget> actions, tabs}) {
    return AppBar(
      bottom: tabs,
      backgroundColor: color ?? ColorConfig.color_bg,
      actions: actions ??
          [
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    locator<NavigationService>().goTo(Routes.CartRoute);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 5),
                    child: Container(
                      width: 54,
                      height: 54,
                      padding: EdgeInsets.all(16),
                      child: WebsafeSvg.asset("assets/images/ic_cart_svg.svg"),
                    ),
                  ),
                ),
                // Positioned(right: 10, top: 7, child: CircleCartCount()),
                // Positioned(
                //     bottom: 2, left: 0, right: 3, child: CartTotalWidget())
              ],
            )
          ],
      leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 45,
          ),
          tooltip: 'Closes application',
          onPressed: () {
            locator<NavigationService>().goBack();
          }),

      // leading: Image.asset("assets/images/menu_icon.png"),
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: Text(title),
    );
  }
}
