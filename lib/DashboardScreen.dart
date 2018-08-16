import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hr_metrics/DashboardItem.dart';
import 'package:hr_metrics/models/dashboard.dart';
import 'package:hr_metrics/models/serializers.dart';

// экран дашборд с главными показателями
class DashboardScreen extends StatelessWidget {
  DashboardScreen(this.database);

  final FirebaseDatabase database;

  @override
  Widget build(BuildContext context) {
    var logo = new AssetImage('assets/logo.png');

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
                    return
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
}
