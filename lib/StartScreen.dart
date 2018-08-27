import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  @override
  StartScreenState createState() {
    return StartScreenState();
  }
}

class StartScreenState extends State<StartScreen> {
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

    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/CheckAuth');
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
