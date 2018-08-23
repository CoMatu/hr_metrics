import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hr_metrics/DashboardScreen.dart';
import 'package:hr_metrics/LoginScreen.dart';
import 'package:hr_metrics/models/userdata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckAuth extends StatefulWidget {
  @override
  CheckAuthState createState() {
    return CheckAuthState();
  }
}

class CheckAuthState extends State<CheckAuth> {
  bool isLoggedIn = false;

  UserData user = UserData();

  @override
  void initState() {
    super.initState();
    this._function();
  }

  @override
  Widget build(BuildContext context) {

    if(isLoggedIn){
      return DashboardScreen();
    } else {
      return LoginScreen();
    }
  }


  Future<Null> _function() async {
    /**
        This Function will be called every single time
        when application is opened and it will check
        if the value inside Shared Preference exist or not
     **/
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    this.setState(() {
      if (prefs.getString("email") != null) {
        isLoggedIn = true;
      } else {
        isLoggedIn = false;
      }
    });
  }

}
