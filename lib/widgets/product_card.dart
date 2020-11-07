import 'package:flutter/material.dart';
import 'package:my_form_admin/models/products_model.dart';
import 'package:my_form_admin/util/utility.dart';

import '../theme/color_config.dart';
import '../theme/theme_constants.dart';
import 'cart_count_widget.dart';


class ProductCard extends StatelessWidget {
  final int itemIndex;
  final Function onPress;
  final ProductResource model;
  final bool isFromSearch;

  ProductCard(
      {Key key, this.itemIndex, this.onPress, this.model, this.isFromSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It  will provide us total height and width of our screen
    return Container(
      height: 90,
      margin: EdgeInsets.symmetric(
        horizontal: 2,
        vertical: 4,
      ),
      // color: Colors.blueAccent,
      child: InkWell(
        onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => ProductDetailsScreen(
          //           model: model,
          //           isFromSearch: isFromSearch,
          //         )));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: ColorConfig.color_danger,
            boxShadow: [kDefaultShadow],
          ),
          child: Container(
            margin: EdgeInsets.only(left: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Hero(
                    tag: 'Producthero' + model.productId + getExtraTag(),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/icon/launch_icon.png',
                      image: model.image,
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.name,
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorConfig.color_bg,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            model.getPackInfo(),
                            style: TextStyle(
                              fontSize: 12,
                              color: ColorConfig.color_bg,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            Utility.roundProductPrice(model.price),
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorConfig.color_danger,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            child: CartCountWidget(),
                          )
                          //         model.resource[itemIndex].productId)),
                          ),
                      if (model.getQty() <= model.getMaxOrderQty())
                        Positioned(
                          right: 0,
                          child: Container(
                            margin: EdgeInsets.only(right: 10, top: 10),
                            child: Text(
                              "Hurry, Only " + model.quantity + " left!",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getExtraTag() {
    return (isFromSearch != null && isFromSearch) ? "@123@" : "";
  }
}
