import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hr_metrics/ChartEntry.dart';
import 'package:hr_metrics/FetchChartData.dart';
import 'package:hr_metrics/LineChart.dart';
import 'package:hr_metrics/SimpleBarChart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;

class ListItem extends StatelessWidget{
//  final String loadUrl; // ссылка на данные из интернета
//  final String title;
  final ChartEntry chartEntry;

  ListItem (this.chartEntry);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                  future: _createData(chartEntry.loadUrl),
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
  static Future<List<charts.Series<ChartData, String>>> _createData(String loadUrl) async {
    final data = await FetchChartData(loadUrl).fetchData(http.Client());

    return [
      new charts.Series<ChartData, String>(
          id: 'Chart Data',
          domainFn: (ChartData series, _) => series.period,
          measureFn: (ChartData series, _) => series.count,
          data: data,
          labelAccessorFn: (ChartData series, _) => '${series.count.toString()}',
          colorFn: (_, __) =>
          charts.MaterialPalette.deepOrange.shadeDefault,
      )
    ];
  }

}

