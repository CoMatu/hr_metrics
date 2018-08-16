import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hr_metrics/DashboardScreen.dart';

class StartScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   var logo = new AssetImage('assets/logo.png');
    // TODO: implement build
    return new Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
            child: FutureBuilder(
              future: _getFirebase(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                  return new Stack(
                    children: <Widget>[
                      SizedBox(
                        height: 250.0,
                        width: 250.0,
                        child: CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation(Colors.yellow[100]),
                          strokeWidth: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 250.0,
                        width: 250.0,
                        child: Image(image: logo),
                      )
                    ],
                  );
              },
            )

        ),
      )
    );
  }
//  Future.delayed(Duration(seconds: 2));

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