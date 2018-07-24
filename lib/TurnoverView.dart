import 'dart:async';

import 'package:charts_common/src/data/series.dart';
import 'package:flutter/material.dart';
import 'package:hr_metrics/SimpleBarChart.dart';
import 'package:hr_metrics/FetchChartData.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;



class TurnoverView extends StatelessWidget{

  const TurnoverView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('СРЕДНЯЯ ЗАРПЛАТА'),

      ),
      body: FutureBuilder<List<charts.Series>>(
        future: _createSampleData(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return new Text('Data is loading...');
            }
            else{
              return new SimpleBarChart(snapshot);
            }
          },
      ),
    );
  }

     static Future<List<charts.Series<ChartData, String>>> _createSampleData() async {
      final data = await fetchData(http.Client());

      return [
        new charts.Series<ChartData, String>(
            id: 'Sales',
            domainFn: (ChartData series, _) => series.period,
            measureFn: (ChartData series, _) => series.count,
            data: data,
            labelAccessorFn: (ChartData series, _) => '${series.count.toString()}'
        )
      ];
    }



}