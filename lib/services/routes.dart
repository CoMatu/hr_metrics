import 'package:flutter/material.dart';
import 'package:hr_metrics/CheckAuth.dart';
import 'package:hr_metrics/DashboardScreen.dart';
import 'package:hr_metrics/LoginScreen.dart';

class Routes {
  var routes = <String, WidgetBuilder>{
    "/Login": (BuildContext context) => LoginScreen(),
    "/Dashboard": (BuildContext context) => DashboardScreen(),
    "/CheckAuth": (BuildContext context) => CheckAuth(),
  };
}
