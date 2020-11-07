import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFutureBuilder extends StatelessWidget {
  Future<dynamic> apiFun;
  final dynamic Function(dynamic) childCallBack;

  String url;
  String apiType;
  Map params;
  Type returnModelType;

  CustomFutureBuilder({@required this.apiFun, @required this.childCallBack});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiFun,
      // ignore: missing_return
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            print('WAITING STATE');
            return Container(
              child: CircularProgressIndicator(
                value: 0.2,
              ),
            );
            break;
          case ConnectionState.done:
            print('DONE STATE');
            if (snapshot.hasError)
              return childCallBack(null);
            else if (snapshot.hasData) return childCallBack(snapshot.data);
            break;
          case ConnectionState.none:
            print('NONE STATE');
            break;
          case ConnectionState.active:
            print('ACTIVE STATE');
            return Container();
            break;
        }
      },
    );
  }
}
