import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hr_metrics/models/dashboard.dart';
import 'package:hr_metrics/models/serializers.dart';


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
                    .child('2')
                    .once()
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

    Map<String, dynamic> data = Map.from(snapshot.data.value);

    Dashboard dashboard = serializers.deserializeWith(Dashboard.serializer,data);

    return new Container(
      child: new Text(dashboard.mainIndicator.toString())
    )
    ;
  }
}
