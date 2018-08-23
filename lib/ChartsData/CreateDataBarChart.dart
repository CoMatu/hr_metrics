import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

class CreateDataBarChart {
  static Future<List<charts.Series<ChartData, String>>> createData(
      List<String> loadUrl, List<charts.Color> color) async {
    var seriesCh = List<charts.Series<ChartData, String>>();

    for (int i = 0; i < loadUrl.length; i++) {
      final data = await _fetchData(http.Client(), loadUrl[i]);
      var id = 'ChartData' + ' ' + i.toString();
      var dataChart = charts.Series<ChartData, String>(
        id: id,
        domainFn: (ChartData series, _) => series.period,
        measureFn: (ChartData series, _) => series.count,
        data: data,
        labelAccessorFn: (ChartData series, _) => '${series.count.toString()}',
        colorFn: (_, __) => color[i],
      );
      seriesCh.add(dataChart);
    }
    return seriesCh;
  }

  static Future<List<ChartData>> _fetchData(
      http.Client client, String loadUrl) async {
    final response = await client.get(loadUrl);

//    return compute(parseChartData, response.body); выдает ошибку
    return parseChartData(response.body);
  }
}

List<ChartData> parseChartData(String responseBody) {
  List<ChartData> dataList = json.decode(responseBody) as List;
  return dataList
      .cast<Map<String, dynamic>>()
      .map((json) => ChartData.fromJson(json))
      .toList();
}

class ChartData {
  final String period;
  final int count;

  ChartData({this.period, this.count});

  factory ChartData.fromJson(Map<String, dynamic> json) {
    return ChartData(
      period: json['year'] as String,
      count: json['number'] as int,
    );
  }
}
