
import 'package:flutter/material.dart';
import 'package:hr_metrics/DashboardScreen.dart';
import 'package:hr_metrics/LoginScreen.dart';
import 'package:hr_metrics/StartScreen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.white24,
        scaffoldBackgroundColor: Colors.grey[200]),
    debugShowCheckedModeBanner: false,
    home: StartScreen(),
    routes: <String, WidgetBuilder>{
      '/LoginScreen': (BuildContext context) => LoginScreen(),
      '/DashboardScreen': (BuildContext context) => DashboardScreen()
    },
  ));
}