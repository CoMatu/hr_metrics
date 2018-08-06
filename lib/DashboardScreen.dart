import 'package:flutter/material.dart';
import 'package:hr_metrics/DashboardItem.dart';

class DashboardScreen extends StatelessWidget{
  final List<DashboardItem> dasboardList;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(),
      body: ListView.builder(
        itemCount: dasboardList.length,
          itemBuilder: (context, index){

          }),
    );
  }

}