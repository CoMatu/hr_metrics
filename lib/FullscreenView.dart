import 'dart:async';

import 'package:hr_metrics/components/Charts/DonutAutoLabelChart.dart';
import 'package:hr_metrics/components/Charts/LineChart.dart';
import 'package:hr_metrics/components/Charts/SimpleBarChart.dart';
import 'package:hr_metrics/ChartsData/ChartEntry.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hr_metrics/ChartsData/CreateDataBarChart.dart';
import 'package:hr_metrics/ChartsData/CreateDataDonutChart.dart';
import 'package:hr_metrics/ChartsData/CreateDataLineChart.dart';
import 'package:hr_metrics/models/bardata.dart';
import 'package:hr_metrics/models/linedata.dart';

class FullscreenView extends StatelessWidget {
  final ChartEntry chartEntry;
  final List<charts.Color> color;
  final Key key;

  FullscreenView(this.chartEntry, this.color, {this.key});

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

  Future _fetchData() async{
    var result;
    var chartType = chartEntry.chartType;
    switch (chartType) {
      case 10:
        result = await _createData(chartEntry.loadUrl, color, chartType);
        return result;
      case 20:
        result =await _createLineData(chartEntry.loadUrl, color, chartType);
        return result;
      case 30:
        result = await _createDonutData(chartEntry.loadUrl, color, chartType);
        return result;
    }
  }

  static Future<List<charts.Series<BarData, String>>> _createData(
      List<String> loadUrl, List<charts.Color> color, int chartType) async {
    Future<List<charts.Series<BarData, String>>> dataCh =
        CreateDataBarChart.createData(loadUrl, color);
    return dataCh;
  }

  static Future<List<charts.Series<LineData, DateTime>>> _createLineData(
      List<String> loadUrl, List<charts.Color> color, int chartType) async {
    Future<List<charts.Series<LineData, DateTime>>> dataLnCh =
        CreateDataLineChart.createData(loadUrl, color);
    return dataLnCh;
  }

  static Future<List<charts.Series<DonutChartData, String>>> _createDonutData(
      List<String> loadUrl, List<charts.Color> color, int chartType) async {
    Future<List<charts.Series<DonutChartData, String>>> dataDnCh =
        CreateDataDonutChart.createData(loadUrl, color);
    return dataDnCh;
  }
}
