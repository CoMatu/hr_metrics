import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hr_metrics/ChartView.dart';
import 'package:hr_metrics/ChartsData/ChartEntry.dart';
import 'package:hr_metrics/DashboardItem.dart';
import 'package:hr_metrics/LoginScreen.dart';
import 'package:hr_metrics/models/dashboard.dart';
import 'package:hr_metrics/models/serializers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:charts_flutter/flutter.dart' as charts;


// экран дашборд с главными показателями
class DashboardScreen extends StatefulWidget {
  @override
  DashboardScreenState createState() {
    return DashboardScreenState();
  }
}

class DashboardScreenState extends State<DashboardScreen> {
  String username;
  SharedPreferences userPref;

  @override
  void initState() {
    super.initState();
    this._function();
  }

  @override
  Widget build(BuildContext context) {

    var logo = AssetImage('assets/logo.png');
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
                  return UserAccountsDrawerHeader(
                    accountName: Text(
                      username,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    accountEmail: null,
                    currentAccountPicture: Icon(Icons.account_circle,
                    size: 100.0,
                    color: Colors.white,),
                    decoration: BoxDecoration(color: Colors.grey[300]),
                  );
                }),
            Expanded(
              child:
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'ЧИСЛЕННОСТЬ',
                      style:
                      TextStyle(fontSize: 20.0, color: Colors.grey[700],
                      fontFamily: 'Oswald'),
                    ),
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ChartView(dataHeadcount, 'ЧИСЛЕННОСТЬ')),
                      );
                    },
                    trailing: Icon(Icons.group),
                  ),
                  ListTile(
                    title: Text(
                      'ЗАРПЛАТА',
                      style:
                      TextStyle(fontSize: 20.0, color: Colors.grey[700],
                          fontFamily: 'Oswald'),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChartView(dataSalary, 'ЗАРПЛАТА')),
                      );
                    },
                    trailing: Icon(Icons.attach_money),
                  ),
                  ListTile(
                    title: Text(
                      'ТЕКУЧЕСТЬ',
                      style:
                      TextStyle(fontSize: 20.0, color: Colors.grey[700],
                          fontFamily: 'Oswald'),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ChartView(dataTurnover, 'ТЕКУЧЕСТЬ КАДРОВ')),
                      );
                    },
                    trailing: Icon(Icons.donut_small),
                  ),
                  ListTile(
                    title: Text(
                      'Выход из аккаунта',
                      //TODO сделать логаут в другом месте
                      style:
                      TextStyle(fontSize:18.0, color: Colors.red),
                    ),
                    onTap: () {
                      _logoutUser();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                ],
              )
            )
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
                        color: Colors.white,
                        width: screenSize.width,
                        height: screenSize.height,
                        child: Center(
                          child: Stack(children: <Widget>[
                            SizedBox(
                              height: 150.0,
                              width: 150.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                    Colors.yellow[100]),
                                strokeWidth: 15.0,
                              ),
                            ),
                            SizedBox(
                              height: 150.0,
                              width: 150.0,
                              child: Image(image: logo),
                            )
                          ]),
                        ));
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
          return DashboardItem(dashboardList[index]);
        });
  }

  Future<DataSnapshot> _getDatabaseData() async {
    final FirebaseApp app = await FirebaseApp.configure(
      name: 'hr-metrics',
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCkbkGrtOChRiDsrRvp_kzMJn_VZqI9M7U',
          databaseURL: 'https://hr-metrics-85b07.firebaseio.com/',
          googleAppID: '1:525720506365:android:dd3d45e37ad67662'),
    );
    FirebaseDatabase database = FirebaseDatabase(app: app);
    return database.reference().child('dashboardList').once();
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
      ['http://skazkimal.ru/hr-metrics/salary.json'],
      'Средняя зарплата, руб.',
      [charts.MaterialPalette.blue.shadeDefault],
      'руб.'), //chart color
/*
  new ChartEntry(
      10,
      ['http://skazkimal.ru/hr-metrics/salaryWorkers.json'],
      'Средняя зарплата рабочих, руб.',
      [charts.MaterialPalette.green.shadeDefault],
      'руб.'),
  new ChartEntry(
      10,
      ['http://skazkimal.ru/hr-metrics/salaryITR.json'],
      'Средняя зарплата ИТР, руб.',
      [charts.MaterialPalette.gray.shadeDefault],
      'руб.'),
*/
  ChartEntry(
      10,
      [
        'http://skazkimal.ru/hr-metrics/salaryITR.json',
        'http://skazkimal.ru/hr-metrics/salaryWorkers.json'
      ],
      'Сравнение ИТР рабочие, руб.',
      [
        charts.MaterialPalette.blue.shadeDefault,
        charts.MaterialPalette.green.shadeDefault
      ],
      'руб.')
];

List<ChartEntry> dataHeadcount = [
  ChartEntry(10, ['headcountData'],
      'Численность, чел.', [charts.MaterialPalette.blue.shadeDefault], 'чел.'),
];
List<ChartEntry> dataTurnover = [
  ChartEntry(20, ['http://skazkimal.ru/hr-metrics/turnover.json'],
      'Текучесть кадров, %', [charts.MaterialPalette.pink.shadeDefault], '%'),
];
List<ChartEntry> dataFot = [
  ChartEntry(
      10,
      ['http://skazkimal.ru/hr-metrics/fot.json'],
      'Фонд оплаты труда, тыс.руб.',
      [charts.MaterialPalette.cyan.shadeDefault],
      'тыс.руб.'),
];
