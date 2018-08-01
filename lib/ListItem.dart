import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hr_metrics/ChartsData/ChartEntry.dart';
import 'package:hr_metrics/Charts/LineChart.dart';
import 'package:hr_metrics/Charts/SimpleBarChart.dart';
import 'package:hr_metrics/ChartsData/CreateDataBarChart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hr_metrics/ChartsData/CreateDataLineChart.dart';
import 'package:http/http.dart' as http;

class ListItem extends StatelessWidget{
  final ChartEntry chartEntry;
  final color;

  ListItem (this.chartEntry, this.color);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 210.0,
      child: Card(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        chartEntry.chartTitle,
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child:
                FutureBuilder<List<charts.Series>>(
                  future: _fetchData(),
                  builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return new Text('Data is loading...');
                    }
                    else{
                      var command = chartEntry.chartType;
                      switch(command) {
                        case 10:
                          return new SimpleBarChart(snapshot.data);
                        case 20:
                          return new LineChart(snapshot.data);
                      }
                    }
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }

  _fetchData() {
    var result;
    var chartType = chartEntry.chartType;
    switch(chartType) {
      case 10:
        result = _createData(chartEntry.loadUrl, color, chartType);
        return result;
      case 20:
        result = _createLineData(chartEntry.loadUrl, color, chartType);
        return result;
    }
  }

  static Future<List<charts.Series<ChartData, String>>> _createData(String loadUrl, var color, int chartType) async {
    Future<List<charts.Series<ChartData, String>>> dataCh;
    dataCh = CreateDataBarChart.createData(loadUrl, color);
    return dataCh;
  }

  static Future<List<charts.Series<ChartData, DateTime>>> _createLineData(String loadUrl, var color, int chartType) async {
    Future<List<charts.Series<ChartData, DateTime>>> dataLnCh;
    dataLnCh = CreateDataLineChart.createData(loadUrl, color) as Future<List<charts.Series<ChartData, DateTime>>>;
    return dataLnCh;
  }

}

