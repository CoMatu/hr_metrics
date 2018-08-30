import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hr_metrics/models/userdata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartScreen extends StatefulWidget {
  @override
  StartScreenState createState() {
    return StartScreenState();
  }
}

class StartScreenState extends State<StartScreen> {

  bool isLoggedIn = false;
  UserData user = UserData();

  startTime() async {
    await FirebaseApp.configure(
      name: 'hr-metrics',
      options: Platform.isIOS
          ? const FirebaseOptions(
          googleAppID: '1:525720506365:ios:d34af888671c6927',
          gcmSenderID: '525720506365',
          databaseURL: 'https://hr-metrics-85b07.firebaseio.com/')
          : const FirebaseOptions(
          apiKey: 'AIzaSyCkbkGrtOChRiDsrRvp_kzMJn_VZqI9M7U',
          databaseURL: 'https://hr-metrics-85b07.firebaseio.com/',
          googleAppID: '1:525720506365:android:dd3d45e37ad67662'),
    );

    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString("email") != null) {
      isLoggedIn = true;
    } else {
      isLoggedIn = false;
    }
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    if(isLoggedIn){
      // инциируем офлайн режим
      FirebaseDatabase database;
      database = FirebaseDatabase.instance;
      database.setPersistenceEnabled(true);
      database.setPersistenceCacheSizeBytes(10000000);

      Navigator.of(context).pushReplacementNamed('/DashboardScreen');
    } else {
      Navigator.of(context).pushReplacementNamed('/LoginScreen');
    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }


  @override
  Widget build(BuildContext context) {

    var logo = AssetImage('assets/logo.png');
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Center(
          child: SizedBox(
        height: 150.0,
        width: 150.0,
        child: Image(image: logo),
      )),
    ));
  }
}
