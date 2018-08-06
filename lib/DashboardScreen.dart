import 'package:flutter/material.dart';
import 'package:hr_metrics/DashboardItem.dart';

class DashboardScreen extends StatelessWidget{
  final List<DashboardItem> dashboardList;

  const DashboardScreen({Key key, this.dashboardList}) : super(key: key);

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
        child: ListView.builder(
          itemCount: 3,
            itemBuilder: (context, index){
              return new DashboardItem();
            }),
      ),
    );
  }

}