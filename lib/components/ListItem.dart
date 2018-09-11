import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hr_metrics/components/Charts/DonutAutoLabelChart.dart';
import 'package:hr_metrics/ChartsData/ChartEntry.dart';
import 'package:hr_metrics/components/Charts/LineChart.dart';
import 'package:hr_metrics/components/Charts/SimpleBarChart.dart';
import 'package:hr_metrics/ChartsData/CreateDataBarChart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hr_metrics/ChartsData/CreateDataDonutChart.dart';
import 'package:hr_metrics/ChartsData/CreateDataLineChart.dart';
import 'package:hr_metrics/screens/FullscreenView.dart';
import 'package:hr_metrics/components/charts/StackedBarChart.dart';
import 'package:hr_metrics/models/bardata.dart';
import 'package:hr_metrics/models/donutdata.dart';
import 'package:hr_metrics/models/linedata.dart';

class ListItem extends StatelessWidget {
  final ChartEntry chartEntry;
  final List<charts.Color> color;

  ListItem(this.chartEntry, {this.color});

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
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.fullscreen,
                      size: 26.0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FullscreenView(chartEntry)),
                      );
                    })
/*                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.fullscreen,
                  size: 26.0,),
                )*/
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: FutureBuilder(
                  future: _fetchData(),
                  // ignore: missing_return
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Data is loading...');
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
            ),
          ],
        ),
      ),
    );
  }

  // ignore: missing_return
  Future _fetchData() async {
    var chartType = chartEntry.chartType;
    switch (chartType) {
      case 10:
        List<charts.Series<BarData, String>> result =
            await _createData(chartEntry.databaseRefName, chartEntry.color, chartType, chartEntry.id);
        return result;
      case 20:
        List<charts.Series<LineData, DateTime>> result = await _createLineData(
            chartEntry.databaseRefName, chartEntry.color, chartType);
        return result;
      case 30:
        List<charts.Series<DonutData, String>> result = await _createDonutData(
                chartEntry.databaseRefName, chartEntry.color, chartType);
        return result;
      case 40:
        List<charts.Series<BarData, String>> result =
        await _createData(chartEntry.databaseRefName, chartEntry.color, chartType, chartEntry.id);
        return result;
    }
  }

  static Future<List<charts.Series<BarData, String>>> _createData(
      List<DatabaseReference> loadUrl, List<charts.Color> color, int chartType, List<String> id) async {
    Future<List<charts.Series<BarData, String>>> dataCh =
        CreateDataBarChart.createData(loadUrl, color, id);
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
