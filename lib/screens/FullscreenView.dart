import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:hr_metrics/components/Charts/DonutAutoLabelChart.dart';
import 'package:hr_metrics/components/Charts/LineChart.dart';
import 'package:hr_metrics/components/Charts/SimpleBarChart.dart';
import 'package:hr_metrics/ChartsData/ChartEntry.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hr_metrics/ChartsData/CreateDataBarChart.dart';
import 'package:hr_metrics/ChartsData/CreateDataDonutChart.dart';
import 'package:hr_metrics/ChartsData/CreateDataLineChart.dart';
import 'package:hr_metrics/components/charts/StackedBarChart.dart';
import 'package:hr_metrics/models/bardata.dart';
import 'package:hr_metrics/models/donutdata.dart';
import 'package:hr_metrics/models/linedata.dart';

class FullscreenView extends StatelessWidget {
  final ChartEntry chartEntry;
  final List<charts.Color> color;
  final Key key;

  FullscreenView(this.chartEntry, {this.color, this.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(chartEntry.chartTitle),
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: FutureBuilder(
                    future: _fetchData(),
                    // ignore: missing_return
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        var command = chartEntry.chartType;
                        switch (command) {
                          case 10:
                            return SimpleBarChart(
                                snapshot.data
                                    as List<charts.Series<dynamic, String>>,
                                chartEntry.units);
                          case 20:
                            return LineChart(
                                snapshot.data
                                    as List<charts.Series<dynamic, DateTime>>,
                                chartEntry.units);
                          case 30:
                            return DonutAutoLabelChart(
                                snapshot.data as List<charts.Series>);
                          case 40:
                            return StackedBarChart(
                                snapshot.data
                                    as List<charts.Series<dynamic, String>>,
                                chartEntry.units);
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future _fetchData() async {
    var result;
    var chartType = chartEntry.chartType;
    switch (chartType) {
      case 10:
        result = await _createData(chartEntry.databaseRefName, chartEntry.color,
            chartType, chartEntry.id);
        return result;
      case 20:
        result = await _createLineData(
            chartEntry.databaseRefName, chartEntry.color, chartType);
        return result;
      case 30:
        result = await _createDonutData(
            chartEntry.databaseRefName, chartEntry.color, chartType);
        return result;
      case 40:
        result = await _createData(chartEntry.databaseRefName, chartEntry.color,
            chartType, chartEntry.id);
        return result;
    }
  }

  static Future<List<charts.Series<BarData, String>>> _createData(
      List<DatabaseReference> databaseRefName,
      List<charts.Color> color,
      int chartType,
      List<String> id) async {
    Future<List<charts.Series<BarData, String>>> dataCh =
        CreateDataBarChart.createData(databaseRefName, color, id);
    return dataCh;
  }

  static Future<List<charts.Series<LineData, DateTime>>> _createLineData(
      List<DatabaseReference> loadUrl, List<charts.Color> color, int chartType) async {
    Future<List<charts.Series<LineData, DateTime>>> dataLnCh =
        CreateDataLineChart.createData(loadUrl, color);
    return dataLnCh;
  }

  static Future<List<charts.Series<DonutData, String>>> _createDonutData(
      List<DatabaseReference> loadUrl, List<charts.Color> color, int chartType) async {
    Future<List<charts.Series<DonutData, String>>> dataDnCh =
        CreateDataDonutChart.createData(loadUrl, color);
    return dataDnCh;
  }
}
