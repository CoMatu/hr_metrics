import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hr_metrics/DashboardItem.dart';
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
                future: database
                    .reference()
                    .child('dashboardList')
                    .once(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return _getWidget(snapshot);
                  } else {
                    return new CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation(Colors.yellow[700]));
                  }
                }),
          )),
    );
  }

  Widget _getWidget(AsyncSnapshot snapshot) {
    List snapdata = new List();
    List<Dashboard> dashboardList = new List();

    for(var value in snapshot.data.value){
      snapdata.add(value);
    }

    for(int i = 0; i< snapdata.length; i++){
    Map<String, dynamic> data = Map.from(snapdata[i]);
    Dashboard dashboard =
    serializers.deserializeWith(Dashboard.serializer, data);
    dashboardList.add(dashboard);
    }

//    Map<String, dynamic> data = Map.from(snapshot.data.value);
    var count = dashboardList.length;

    print(count.toString());

    return new ListView.builder(
      itemCount: count,
        itemBuilder: (context, index){
          return new DashboardItem(dashboardList[index]);
        });
/*
    Dashboard dashboard =
        serializers.deserializeWith(Dashboard.serializer, data);

    return new Container(child: new Text(dashboard.mainIndicator.toString()));
*/
  }
}
