import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hr_metrics/DashboardItem.dart';
import 'package:hr_metrics/models/dashboard.dart';
import 'package:hr_metrics/models/serializers.dart';
import 'package:firebase_core/firebase_core.dart';

// экран дашборд с главными показателями
class DashboardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var logo = new AssetImage('assets/logo.png');
    final Size screenSize = MediaQuery.of(context).size;

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
                future: _getDatabaseData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return _getWidget(snapshot);
                  } else {
                    return new Container(
                        color: Colors.white,
                      width: screenSize.width,
                      height: screenSize.height,
                      child: Center(
                        child:
                        new Stack(
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
                            ]
                        ),
                      )
                    );
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

    var count = dashboardList.length;

//    print(count.toString());

    return new ListView.builder(
      itemCount: count,
        itemBuilder: (context, index){
          return new DashboardItem(dashboardList[index]);
        });
  }

  Future<DataSnapshot> _getDatabaseData() async{
    final FirebaseApp app = await FirebaseApp.configure(
      name: 'hr-metrics',
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCkbkGrtOChRiDsrRvp_kzMJn_VZqI9M7U',
          databaseURL: 'https://hr-metrics-85b07.firebaseio.com/',
          googleAppID: '1:525720506365:android:dd3d45e37ad67662'),
    );
    FirebaseDatabase database = new FirebaseDatabase(app: app);
    return database
          .reference()
          .child('dashboardList')
          .once();
}
}
