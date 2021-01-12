// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:infinite_data/views/other/welcome.dart';
import 'package:infinite_data/views/auth/login.dart';
import 'package:infinite_data/views/auth/register.dart';
import 'package:infinite_data/views/auth/packages.dart';

class Routes {
  static const welcomePage = '/';
  static const login = '/login';
  static const register = '/register';
  static const packages = '/packages';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Routes>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.welcomePage:
        return MaterialPageRoute(
          builder: (_) => WelcomePage(),
          settings: settings,
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => Login(),
          settings: settings,
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => Register(),
          settings: settings,
        );
      case Routes.packages:
        return MaterialPageRoute(
          builder: (_) => Packages(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
