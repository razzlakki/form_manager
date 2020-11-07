import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/color_config.dart';

// ignore: must_be_immutable
class CartCountWidget extends StatefulWidget {
  @override
  _CartCountWidgetState createState() => _CartCountWidgetState();
}

class _CartCountWidgetState extends State<CartCountWidget> {
  bool showLoader = false;

  Widget getCartCountWidget() {
    return /*updateCartModel?.updateCartMap?.containsKey(widget.model.productId) ??
                false
            ?*/
        Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 46,
            height: 28,
            child: MaterialButton(
              color: ColorConfig.color_bg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              onPressed: () {
                // updateUI(true);
                // DataUtil.get().addProductToCart(CartHandleType.REMOVE,
                //     widget.model.productId, context, notify: () {
                //   updateUI(false);
                // });
              },
              child: Text(
                "-",
                style: TextStyle(fontSize: 16, color: ColorConfig.color_white),
              ),
            ),
          ),
          SizedBox(
            width: 30,
            child: Center(
              child: showLoader
                  ? Container(
                      child: CircularProgressIndicator(),
                      width: 20,
                      height: 20,
                    )
                  : Text(
                      '0',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: ColorConfig.color_bg),
                      textAlign: TextAlign.center,
                    ),
            ),
          ),
          Container(
            width: 46,
            height: 28,
            child: MaterialButton(
              color: ColorConfig.color_bg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              onPressed: () {
                // if (updateCartModel
                //         ?.updateCartMap[widget.model.productId].qty <
                //     int.parse(widget.model.maxOrderQuantity)) {
                //   updateUI(true);
                //   DataUtil.get().addProductToCart(CartHandleType.ADD,
                //       widget.model.productId, context, notify: () {
                //     updateUI(false);
                //   });
                // } else {
                //   ToastUtil.showToast("Max Order per this item " +
                //       widget.model.maxOrderQuantity);
                // }
              },
              child: Text(
                "+",
                style: TextStyle(color: ColorConfig.color_white, fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            width: 6,
          )
        ],
      ),
    );
    //  : _addCartWidget('Add', updateCartModel: updateCartModel)
  }

  Widget _addCartWidget(title, {updateCartModel}) {
    return Container(
      height: 32,
      child: showLoader
          ? Container(
              child: CircularProgressIndicator(),
              width: 20,
              height: 20,
            )
          : MaterialButton(
              color: ColorConfig.color_danger,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.zero,
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.circular(16.0)),
              ),
              onPressed: () {
                // if (title == 'Add') {
                //     updateUI(true);
                //     DataUtil.get().addProductToCart(
                //         CartHandleType.ADD, widget.model.productId, context,
                //         notify: () {
                //       updateUI(false);
                //     });
                // }
              },
              child: SizedBox(
                width: title == 'Add' ? 80 : 180,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 16, color: ColorConfig.color_white),
                ),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getCartCountWidget();
  }

  void updateUI(bool bool) {
    showLoader = bool;
    setState(() {});
  }
}
