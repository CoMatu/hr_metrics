import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hr_metrics/DashboardItem.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hr_metrics/models/dashboard.dart';

// экран дашборд с главными показателями
class DashboardScreen extends StatelessWidget {
  DashboardScreen({this.app});

  FirebaseApp app;

  @override
  Widget build(BuildContext context) {
    FirebaseDatabase database = new FirebaseDatabase(app: app);

    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text('ИНФОПАНЕЛЬ'),
      ),
      drawer: Drawer(
//TODO боковое меню
          ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: new FutureBuilder(
                future: FirebaseDatabase.instance.reference()
                    .child('dashboardList')
                    .once(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return _getWidget(snapshot);
                  }
                     else {
                      return new CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation(Colors.yellow[700]));
                    }

                }),
          )),
    );
  }

  Widget _getWidget(AsyncSnapshot snapshot) {
    String data = snapshot.data.toString();
    return new Container(
      child: new Text(data)
    );
  }

  Future _getData() async {
    final FirebaseDatabase database = new FirebaseDatabase(app: app);
    String data;
    database
        .reference()
        .child('dashboardList')
        .child('0')
        .once()
        .then((DataSnapshot snapshot) {
      data = snapshot.value;
      print(data);
    });
    return data;
  }
}
