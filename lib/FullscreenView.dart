import 'dart:async';

import 'package:hr_metrics/Charts/DonutAutoLabelChart.dart';
import 'package:hr_metrics/Charts/LineChart.dart';
import 'package:hr_metrics/Charts/SimpleBarChart.dart';
import 'package:hr_metrics/ChartsData/ChartEntry.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hr_metrics/ChartsData/CreateDataBarChart.dart';
import 'package:hr_metrics/ChartsData/CreateDataDonutChart.dart';
import 'package:hr_metrics/ChartsData/CreateDataLineChart.dart';

class FullscreenView extends StatelessWidget{
  final ChartEntry chartEntry;
  final color;
  final Key key;

  FullscreenView(this.chartEntry, this.color, {this.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(chartEntry.chartTitle),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: FutureBuilder<List<charts.Series>>(
                  future: _fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return new Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      var command = chartEntry.chartType;
                      switch (command) {
                        case 10:
                          return new SimpleBarChart(snapshot.data);
                        case 20:
                          return new LineChart(snapshot.data);
                        case 30:
                          return new DonutAutoLabelChart(snapshot.data);
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
  _fetchData() {
    var result;
    var chartType = chartEntry.chartType;
    switch (chartType) {
      case 10:
        result = _createData(chartEntry.loadUrl, color, chartType);
        return result;
      case 20:
        result = _createLineData(chartEntry.loadUrl, color, chartType);
        return result;
      case 30:
        result = _createDonutData(chartEntry.loadUrl, color, chartType);
        return result;
    }
  }

  static Future<List<charts.Series<ChartData, String>>> _createData(
      List<String> loadUrl, var color, int chartType) async {
    Future<List<charts.Series<ChartData, String>>> dataCh;
    dataCh = CreateDataBarChart.createData(loadUrl, color);
    return dataCh;
  }

  static Future<List<charts.Series<LineChartData, DateTime>>> _createLineData(
      List<String> loadUrl, var color, int chartType) async {
    Future<List<charts.Series<LineChartData, DateTime>>> dataLnCh;
    dataLnCh = CreateDataLineChart.createData(loadUrl, color);
    return dataLnCh;
  }

  static Future<List<charts.Series<DonutChartData, String>>> _createDonutData(
      List<String> loadUrl, var color, int chartType) async {
    Future<List<charts.Series<DonutChartData, String>>> dataDnCh;
    dataDnCh = CreateDataDonutChart.createData(loadUrl, color);
    return dataDnCh;
  }

}