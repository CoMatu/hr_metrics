import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hr_metrics/DashboardScreen.dart';
import 'package:hr_metrics/LoginScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hr_metrics/StartScreen.dart';
import 'package:hr_metrics/models/userdata.dart';

class CheckAuth extends StatelessWidget {
//  final GoogleSignIn _googleSignIn = GoogleSignIn();
//  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseDatabase database;
  bool isLoggedIn;

  UserData user = new UserData('matu11@mail.ru', '22ll55');
//TODO убрать артефакт квадрат при запуске приложения(?)
  @override
  Widget build(BuildContext context) {
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
                _getFirebase();
                return new DashboardScreen(database);
              } else {
                return new LoginScreen();
              }
            }
          }),
    ));

    //   return isLoggedIn ? new DashboardScreen(database) : new LoginScreen();
  }

  Future<void> _getFirebase() async {
    final FirebaseApp app = await FirebaseApp.configure(
      name: 'hr-metrics',
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCkbkGrtOChRiDsrRvp_kzMJn_VZqI9M7U',
          databaseURL: 'https://hr-metrics-85b07.firebaseio.com/',
          googleAppID: '1:525720506365:android:dd3d45e37ad67662'),
    );
    database = new FirebaseDatabase(app: app);
  }

  Future<FirebaseUser> verifyUser() async {
    //инициализируем датабазу
    final FirebaseApp app = await FirebaseApp.configure(
      name: 'hr-metrics',
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCkbkGrtOChRiDsrRvp_kzMJn_VZqI9M7U',
          databaseURL: 'https://hr-metrics-85b07.firebaseio.com/',
          googleAppID: '1:525720506365:android:dd3d45e37ad67662'),
    );
    database = new FirebaseDatabase(app: app);

//проверяем пользователя
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//    await firebaseAuth.signInWithEmailAndPassword(
//        email: userData.email, password: userData.password);
    FirebaseUser currentUser = await firebaseAuth.currentUser();
    print('$currentUser');
    return currentUser;
  }
}
