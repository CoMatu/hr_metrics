import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hr_metrics/DashboardEntry.dart';
import 'package:hr_metrics/DashboardItem.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
// экран дашборд с главными показателями
class DashboardScreen extends StatelessWidget{
  List<DashboardEntry> dashboardList;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text('ИНФОПАНЕЛЬ'),
      ),
      drawer: Drawer(

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _fetchDb(),
            builder: (context, snapshot) {
            return ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index){
                    return new DashboardItem();
                  });
            }
            )
/*
,
*/
      ),
    );
  }

 Future _fetchDb() async{
    final FirebaseApp app = await FirebaseApp.configure(
        name: 'hr-metrics',
        options: const FirebaseOptions(
          apiKey: 'AIzaSyCkbkGrtOChRiDsrRvp_kzMJn_VZqI9M7U',
            databaseURL: 'https://hr-metrics-85b07.firebaseio.com/',
            googleAppID: '1:525720506365:android:dd3d45e37ad67662'),
    );
    final FirebaseDatabase database = new FirebaseDatabase(app: app);
    DatabaseReference _dashboardRef = database.reference().child('dashboardList');

    database.reference().child('dashboardList').once()
        .then((DataSnapshot snapshot) {
      print('Connected to second database and read ${snapshot.value}');
      //здесь возвращает как json строку и нужно из нее собрать объект DashboardEntry
      dashboardList = snapshot.value;
    });
    return dashboardList;
 }

}