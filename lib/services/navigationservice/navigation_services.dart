import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> goTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushReplacementNamed(routeName);
  }

  void goBack() {
    navigatorKey.currentState.pop();
  }

  clearAll() {
    while (navigatorKey.currentState.canPop()) navigatorKey.currentState.pop();
  }

  void pushAndRemoveUntil(String routeName) {
    navigatorKey.currentState.popAndPushNamed(routeName);
  }
}
