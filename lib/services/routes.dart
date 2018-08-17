import 'package:flutter/material.dart';
import 'package:hr_metrics/CheckAuth.dart';
import 'package:hr_metrics/DashboardScreen.dart';
import 'package:hr_metrics/LoginScreen.dart';

class Routes {
  var routes = <String, WidgetBuilder>{
    "/Login": (BuildContext context) => new LoginScreen(),
    "/Dashboard": (BuildContext context) => new DashboardScreen(),
    "/CheckAuth": (BuildContext context) => new CheckAuth(),
  };
}
