import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../custom_ui/my_farm_scaffold.dart';
import '../models/base_res_model.dart';
import 'package:provider/provider.dart';

abstract class CustomState<T extends StatefulWidget, N extends BaseResModel>
    extends State<T> {
  bool isScaffoldRequired = true;

  myAppBar() {
    return null;
  }

  @override
  void initState() {
    super.initState();
    isScaffoldRequired = scaffoldRequired();
    Future.delayed(Duration(microseconds: 50), () async {
      doAPICall();
    });
  }

  @override
  Widget build(BuildContext context) {
    return isScaffoldRequired
        ? MyFarmScaffold(
            child: Consumer<N>(builder: (context, model, child) {
              return handelBuild(context, model);
            }),
            appbar: myAppBar(),
          )
        : Material(
            color: Colors.transparent,
            child: Consumer<N>(builder: (context, model, child) {
              return handelBuild(context, model);
            }),
          );
  }

  Widget cBuild(BuildContext context, N model);

  Widget cShowLoader(BuildContext context);

  Widget handelBuild(BuildContext context, BaseResModel model) {
    return (model.status == APIStatus.DONE)
        ? cBuild(context, model)
        : cShowLoader(context);
  }

  bool scaffoldRequired() {
    return true;
  }

  void doAPICall() {}
}
