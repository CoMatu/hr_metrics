import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hr_metrics/DashboardEntry.dart';
import 'package:hr_metrics/DashboardItem.dart';
import 'package:firebase_database/firebase_database.dart';

// экран дашборд с главными показателями
class DashboardScreen extends StatelessWidget {
  List<DashboardEntry> dashboardList;

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
          child: FutureBuilder(
              future: _fetchDb(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return new DashboardItem();
                    });
              })),
    );
  }

  Future _fetchDb() async {
    String data;

    final FirebaseApp app = await FirebaseApp.configure(
      name: 'hr-metrics',
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCkbkGrtOChRiDsrRvp_kzMJn_VZqI9M7U',
          databaseURL: 'https://hr-metrics-85b07.firebaseio.com/',
          googleAppID: '1:525720506365:android:dd3d45e37ad67662'),
    );
    final FirebaseDatabase database = new FirebaseDatabase(app: app);

    database
        .reference()
        .child('dashboardList')
        .once()
        .then((DataSnapshot snapshot) {
      data = snapshot.value.toString();
      print(data);
    });
    return data;
  }
}
