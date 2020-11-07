import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_form_admin/custom_ui/loading_widget.dart';
import 'package:my_form_admin/custom_ui/my_farm_app_bar.dart';
import 'package:my_form_admin/models/products_model.dart';
import 'package:my_form_admin/services/di/locator.dart';
import 'package:my_form_admin/services/navigationservice/navigation_services.dart';
import 'package:my_form_admin/services/navigationservice/route_paths.dart';
import 'package:my_form_admin/util/shared_pref_utility.dart';
import 'package:my_form_admin/widgets/custom_state.dart';



class OrdersScreen extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends CustomState<OrdersScreen, ProductsModel> {

  @override
  myAppBar() {
    // TODO: implement myAppBar
    return MyFarmAppBar.getCustomAppBar(title:'Orders',actions: [InkWell(onTap: () {
      SharedPrefUtility().removeAll();
      locator<NavigationService>().navigateTo(Routes.LoginRoute);
    }, child: Icon(Icons.logout))]);
  }

  @override
  Widget cBuild(BuildContext context, ProductsModel model) {
    model = model.validateProducts();
    return Container(
      child: Center(child: Text('Orders'),),
    );
  }

  @override
  Widget cShowLoader(BuildContext context) {
    return LoadingWidget();
  }
}
