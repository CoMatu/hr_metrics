import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hr_metrics/ChartEntry.dart';
import 'package:hr_metrics/FetchChartData.dart';
import 'package:hr_metrics/LineChart.dart';
import 'package:hr_metrics/SimpleBarChart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;

class SalaryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String loadUrl = 'http://skazkimal.ru/hr-metrics/salary.json';
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ЗАРПЛАТА'),
      ),
      body: Center(
          child: ListView(
        children: <Widget>[
          SizedBox(
            child: Card(
              child: Column(
                children: <Widget>[
                  Text(
                    'Средняя зарплата, руб.',
                    style: new TextStyle(fontSize: 16.0),
                  ),
                  Expanded(
                    child:
                    FutureBuilder<List<charts.Series>>(
                      future: _createData(loadUrl),
                      builder: (context, snapshot){
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return new Text('Data is loading...');
                        }
                        else{
                              return new SimpleBarChart(snapshot.data);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  static Future<List<charts.Series<ChartData, String>>> _createData(String loadUrl) async {
    final data = await FetchChartData(loadUrl).fetchData(http.Client());

    return [
      new charts.Series<ChartData, String>(
        id: 'Chart Data',
        domainFn: (ChartData series, _) => series.period,
        measureFn: (ChartData series, _) => series.count,
        data: data,
        labelAccessorFn: (ChartData series, _) => '${series.count.toString()}',
/*
          colorFn: (_, __) =>
          charts.MaterialPalette.deepOrange.shadeDefault,
*/
      )
    ];
  }

}
