import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hr_metrics/models/dashboard.dart';

// экран дашборд с главными показателями
class DashboardScreen extends StatelessWidget {
  DashboardScreen(this.database);
  FirebaseDatabase database;

  @override
  Widget build(BuildContext context) {

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
                future:
                database
                    .reference()
                    .child('dashboardList')
                    .once()
                    .then((DataSnapshot snapshot) {
                  String data = snapshot.value.toString();
                  print(data);
                  return data;
                })
                ,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
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
/*
    List<Dashboard> dashboard;
    dashboard = parseDashboard(snapshot.data);
*/
    return new Container(
      child: new Text(snapshot.data)
    )
    ;
  }

  // из ответа датабазы формируем список параметров объектов дашборда
  List<Dashboard> parseDashboard(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Dashboard>((json) => Dashboard.fromJson(json)).toList();
  }
}
