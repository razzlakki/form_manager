import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          child: FlareActor(
            "assets/images/loading.flr",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: "loading",
          ),
        ),
      ),
    );
  }
}
