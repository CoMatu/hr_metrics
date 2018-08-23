import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hr_metrics/components/Charts/DonutAutoLabelChart.dart';
import 'package:hr_metrics/ChartsData/ChartEntry.dart';
import 'package:hr_metrics/components/Charts/LineChart.dart';
import 'package:hr_metrics/components/Charts/SimpleBarChart.dart';
import 'package:hr_metrics/ChartsData/CreateDataBarChart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hr_metrics/ChartsData/CreateDataDonutChart.dart';
import 'package:hr_metrics/ChartsData/CreateDataLineChart.dart';
import 'package:hr_metrics/FullscreenView.dart';

class ListItem extends StatelessWidget {
  final ChartEntry chartEntry;
  final List<charts.Color> color;
//TODO Как кэшировать данные графиков?
  //TODO разные Item для разных карточек
  ListItem(this.chartEntry, this.color);

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
                  icon: Icon(Icons.fullscreen,
                  size: 26.0,),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          FullscreenView(chartEntry, color)
                      ),
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
                          return SimpleBarChart(snapshot.data as List<charts.Series<dynamic, String>>, chartEntry.units);
                        case 20:
                          return LineChart(snapshot.data as List<charts.Series<dynamic, DateTime>>, chartEntry.units);
                        case 30:
                          return DonutAutoLabelChart(snapshot.data as List<charts.Series>);
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
    List<charts.Series<ChartData, String>> result;
    var chartType = chartEntry.chartType;
    switch (chartType) {
      case 10:
        result = await _createData(chartEntry.loadUrl, color, chartType);
        return result;
      case 20:
        result = await _createLineData(chartEntry.loadUrl, color, chartType)
        as List<charts.Series<ChartData, String>>;
        return result;
      case 30:
        result = await _createDonutData(chartEntry.loadUrl, color, chartType)
        as List<charts.Series<ChartData, String>>;
        return result;
    }
  }

  static Future<List<charts.Series<ChartData, String>>> _createData(
      List<String> loadUrl, List<charts.Color> color, int chartType) async {
    Future<List<charts.Series<ChartData, String>>> dataCh =
    CreateDataBarChart.createData(loadUrl, color);
    return dataCh;
  }

  static Future<List<charts.Series<LineChartData, DateTime>>> _createLineData(
      List<String> loadUrl, List<charts.Color> color, int chartType) async {
    Future<List<charts.Series<LineChartData, DateTime>>> dataLnCh;
    dataLnCh = CreateDataLineChart.createData(loadUrl, color);
    return dataLnCh;
  }

  static Future<List<charts.Series<DonutChartData, String>>> _createDonutData(
      List<String> loadUrl, List<charts.Color> color, int chartType) async {
    Future<List<charts.Series<DonutChartData, String>>> dataDnCh;
    dataDnCh = CreateDataDonutChart.createData(loadUrl, color);
    return dataDnCh;
  }
}
