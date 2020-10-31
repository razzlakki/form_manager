import 'package:flutter/material.dart';
import 'package:my_form_admin/theme/color_config.dart';

// ignore: must_be_immutable
class MyFarmScaffold extends StatefulWidget {
  final Widget child;
  final AppBar appbar;

  Color bgcolor;

  Widget drawer;

  Widget bottomNavigationBar;
  FloatingActionButton floatingActionButton;

  MyFarmScaffold(
      {Key key,
      @required this.child,
      this.appbar,
      this.bgcolor,
      this.drawer,
      this.floatingActionButton,
      this.bottomNavigationBar})
      : super(key: key);

  @override
  _MyFarmScaffoldState createState() => _MyFarmScaffoldState();
}

class _MyFarmScaffoldState extends State<MyFarmScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: widget.bgcolor ?? ColorConfig.color_app_bg,
      appBar: widget.appbar,
      drawer: widget.drawer ?? widget.drawer,
      bottomNavigationBar:
          widget.bottomNavigationBar ?? widget.bottomNavigationBar,
      body: SafeArea(
          child: Container(
        width: double.infinity,
        child: widget.child,
      )),
      floatingActionButton: widget.floatingActionButton,
    );
  }
}
