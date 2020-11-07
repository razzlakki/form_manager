import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_form_admin/custom_ui/custom_dialog.dart';
import 'package:my_form_admin/custom_ui/loading_widget.dart';
import 'package:my_form_admin/custom_ui/my_farm_app_bar.dart';
import 'package:my_form_admin/models/products_model.dart';
import 'package:my_form_admin/services/api/api_service.dart';
import 'package:my_form_admin/services/di/locator.dart';
import 'package:my_form_admin/services/navigationservice/navigation_services.dart';
import 'package:my_form_admin/services/navigationservice/route_paths.dart';
import 'package:my_form_admin/util/api_constants.dart';
import 'package:my_form_admin/util/shared_pref_utility.dart';
import 'package:my_form_admin/widgets/custom_state.dart';
import 'package:my_form_admin/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends CustomState<ProductListScreen, ProductsModel> {
  @override
  myAppBar() {
    // TODO: implement myAppBar
    return MyFarmAppBar.getCustomAppBar(title: 'Products', actions: [
      InkWell(
          onTap: () {
            SharedPrefUtility().removeAll();
            locator<NavigationService>().navigateTo(Routes.LoginRoute);
          },
          child: Icon(Icons.logout))
    ]);
  }

  @override
  Widget cBuild(BuildContext context, ProductsModel model) {
    model = model.validateProducts();
    return Container(
      margin: EdgeInsets.all(8),
      padding: const EdgeInsets.only(
        top: 1,
      ),
      child: ListView.builder(
          itemCount: model?.resource?.length ?? 0,
          itemBuilder: (_, index) {
            return ProductCard(
              model: model.resource[index],
              itemIndex: index,
              onPress: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => ProductDetailsScreen(
                //           model: model.resource[index],
                //         )));
              },
            );
          }),
    );
  }

  @override
  void doAPICall() {
    super.doAPICall();

    // DataUtil.get().getCartItems(context, notify: () {
    //   print('CODE UPDATED');
    // });
    ApiService(
            url: ApiConstants.PRODUCT_LIST,
            reqType: ReqType.POST,
            params: {},
            model: Provider.of<ProductsModel>(context, listen: false))
        .dioReq()
        .then((model) {
      ProductsModel productsModel = model as ProductsModel;
      if (productsModel.messageCode != 200) {
        CustomDialog().showMessageDialog(true, message: productsModel.message);
      }
    }).catchError((onError) {
      CustomDialog().showMessageDialog(true, message: onError);
    });
  }

  @override
  Widget cShowLoader(BuildContext context) {
    return LoadingWidget();
  }
}
