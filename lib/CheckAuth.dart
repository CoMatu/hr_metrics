import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hr_metrics/DashboardScreen.dart';
import 'package:hr_metrics/LoginScreen.dart';
import 'package:hr_metrics/StartScreen.dart';
import 'package:hr_metrics/models/userdata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckAuth extends StatefulWidget {
  @override
  CheckAuthState createState() {
    return new CheckAuthState();
  }
}

class CheckAuthState extends State<CheckAuth> {
  bool isLoggedIn = false;

  UserData user = new UserData();

  @override
  void initState() {
    super.initState();
    this._function();
  }

  @override
  Widget build(BuildContext context) {
    user.email = 'matu123@mail.ru';
    user.password = '22ll55';
    return new Scaffold(
        body: Center(
      child: FutureBuilder(
          future: verifyUser(),
          // читаем из настроек данные пользователя
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return new StartScreen();
            }
            if (snapshot.data != null) {
              FirebaseUser _user = snapshot.data;
              if (_user.email == user.email) {
//                _getFirebase();
                return new DashboardScreen();
              } else {
                return new LoginScreen();
              }
            }
          }),
    ));
  }

  Future<FirebaseUser> verifyUser() async {
    //проверяем наличие пользователя в настройках
    SharedPreferences userPrefs = await SharedPreferences.getInstance();

//проверяем пользователя в файрбазе
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser currentUser = await firebaseAuth.currentUser();
    print('$currentUser');
    return currentUser;
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
      if (prefs.getString("username") != null) {
        isLoggedIn = true;
      } else {
        isLoggedIn = false;
      }
    });
  }

}
