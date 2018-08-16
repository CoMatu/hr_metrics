
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hr_metrics/DashboardScreen.dart';
import 'package:hr_metrics/LoginScreen.dart';

class CheckAuth extends StatefulWidget {

//  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  _CheckAuthState createState() => new _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  FirebaseDatabase database;
  bool isLoggedIn;

  @override
  void initState() {
    database = _getFirebase();
    isLoggedIn = false;
    FirebaseAuth.instance.currentUser().then((user) => user != null
        ? setState(() {
      isLoggedIn = true;
    })
        : null);
    super.initState();
    // new Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? new DashboardScreen(database) : new LoginScreen();
  }

  Future  _getFirebase() async{
    final FirebaseApp app = await FirebaseApp.configure(
      name: 'hr-metrics',
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCkbkGrtOChRiDsrRvp_kzMJn_VZqI9M7U',
          databaseURL: 'https://hr-metrics-85b07.firebaseio.com/',
          googleAppID: '1:525720506365:android:dd3d45e37ad67662'),
    );
    final FirebaseDatabase database = new FirebaseDatabase(app: app);
    return database;
  }

}