import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hr_metrics/ChartsData/ChartEntry.dart';
import 'package:hr_metrics/demo/DashboardItemDemo.dart';
import 'package:hr_metrics/screens/LoginScreen.dart';
import 'package:hr_metrics/models/dashboard.dart';
import 'package:hr_metrics/models/serializers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// экран дашборд с главными показателями
class DashboardScreenDemo extends StatefulWidget {
  @override
  DashboardScreenDemoState createState() {
    return DashboardScreenDemoState();
  }
}

class DashboardScreenDemoState extends State<DashboardScreenDemo> {
  String username;
  SharedPreferences userPref;

  @override
  void initState() {
    super.initState();
//    this._function();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('ИНФОПАНЕЛЬ'),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            FutureBuilder(
                future: _function(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          UserAccountsDrawerHeader(
                            accountName: Text(
                              username,
                              style: TextStyle(fontSize: 20.0),
                            ),
                            accountEmail: null,
                            currentAccountPicture: Icon(
                              Icons.account_circle,
                              size: 100.0,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(color: Colors.grey[300]),
                          ),
                          ListTile(
                            title: Text(
                              'Выход из аккаунта',
                              style: TextStyle(fontSize: 18.0, color: Colors.red),
                            ),
                            onTap: () {
                              _logoutUser();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                            trailing: Icon(Icons.exit_to_app),
                          ),
                        ],
                      ));
                }),
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: FutureBuilder(
                future: _getDatabaseData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return _getWidget(snapshot);
                  } else {
                    return Container(
                      width: screenSize.width,
                      height: screenSize.height,
                    );
                  }
                }),
          )),
    );
  }

  Widget _getWidget(AsyncSnapshot snapshot) {
    List snapdata = List();
    List<Dashboard> dashboardList = List();

    for (var value in snapshot.data.value) {
      snapdata.add(value);
    }

    for (int i = 0; i < snapdata.length; i++) {
      Map<String, dynamic> data = Map.from(snapdata[i] as Map);
      Dashboard dashboard =
      serializers.deserializeWith(Dashboard.serializer, data);
      dashboardList.add(dashboard);
    }

    var count = dashboardList.length;

//    print(count.toString());

    return ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          return DashboardItemDemo(dashboardList[index]);
        });
  }

  Future<DataSnapshot> _getDatabaseData() async {
    var _database = await FirebaseDatabase.instance
        .reference()
        .child('demo')
        .child('dashboardList')
        .once();
    return _database;
  }

  Future<void> _function() async {
    userPref = await SharedPreferences.getInstance();
    this.setState(() {
      if (userPref != null) {
        username = userPref.getString("email");
      }
      if (userPref.getString("email") == null) {
        username = '';
      }
    });
  }

  Future<Null> _logoutUser() async {
    //logout user
    userPref = await SharedPreferences.getInstance();
    userPref.clear();
  }
}

List<ChartEntry> dataSalary = [
  ChartEntry(
    10,
    [''],
    [FirebaseDatabase.instance.reference().child('demo').child('salaryData')],
    'Средняя зарплата, руб.',
    [charts.MaterialPalette.blue.shadeDefault],
    'руб.',
  ), //chart color
  ChartEntry(
      10,
      ['ИТР', 'рабочие'],
      [
        FirebaseDatabase.instance.reference().child('demo').child('salaryITRData'),
        FirebaseDatabase.instance.reference().child('demo').child('salaryWorkersData')],
      'Сравнение ИТР рабочие, руб.',
      [
        charts.MaterialPalette.blue.shadeDefault,
        charts.MaterialPalette.green.shadeDefault
      ],
      'руб.')
];

List<ChartEntry> dataHeadcount = [
  ChartEntry(10, [''], [FirebaseDatabase.instance.reference().child('demo').child('headcountData')], 'Численность, чел.',
      [charts.MaterialPalette.blue.shadeDefault], 'чел.'),
  ChartEntry(
      40,
      ['ИТР', 'рабочие'],
      [
        FirebaseDatabase.instance.reference().child('demo').child('headcountITRData'),
        FirebaseDatabase.instance.reference().child('demo').child('headcountWorkersData')],
      'Численность по категориям ИТР/рабочие',
      [
        charts.MaterialPalette.blue.shadeDefault.lighter,
        charts.MaterialPalette.blue.shadeDefault
      ],
      'чел.'),
  ChartEntry(10, [''], [FirebaseDatabase.instance.reference().child('demo').child('headcountTemp')], 'Численность временных сотрудников',
      [charts.MaterialPalette.green.shadeDefault.lighter], 'чел.')
];
List<ChartEntry> dataTurnover = [
  ChartEntry(20, [''], [FirebaseDatabase.instance.reference().child('demo').child('turnoverData')], 'Текучесть кадров, %',
      [charts.MaterialPalette.pink.shadeDefault], '%'),
  ChartEntry(
      10,
      ['принято', 'уволено'],
      [
        FirebaseDatabase.instance.reference().child('demo').child('turnover_in'),
        FirebaseDatabase.instance.reference().child('demo').child('turnover_out')],
      'Принято и уволено',
      [
        charts.MaterialPalette.blue.shadeDefault.lighter,
        charts.MaterialPalette.blue.shadeDefault
      ],
      'чел.')
];
List<ChartEntry> dataAge = [
  ChartEntry(
      10,
      [''],
      [FirebaseDatabase.instance.reference().child('demo').child('ageData')],
      'Распределение по возрастам',
      [
        charts.MaterialPalette.blue.shadeDefault.lighter,
      ],
      'чел.')
];
