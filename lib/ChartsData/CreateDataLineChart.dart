import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

class CreateDataLineChart {
  static Future<List<charts.Series<LineChartData, DateTime>>> createData(
      List<String> loadUrl, List<charts.Color> color) async {
    var seriesData = List<charts.Series<LineChartData, DateTime>>();

    for (int i = 0; i < loadUrl.length; i++) {
      final data = await _fetchData(http.Client(), loadUrl[i]);
      var id = 'ChartData' + ' ' + i.toString();

      seriesData.add(charts.Series<LineChartData, DateTime>(
        id: id,
        domainFn: (LineChartData series, _) => series.period,
        measureFn: (LineChartData series, _) => series.count,
        data: data,
        labelAccessorFn: (LineChartData series, _) => '${series.count
            .toString()}',
        colorFn: (_, __) => color[i],
      ));
    }
    return seriesData;
  }

  static Future<List<LineChartData>> _fetchData(
      http.Client client, String loadUrl) async {
    final response = await client.get(loadUrl);

//    return compute(parseChartData, response.body); выдает ошибку
    return parseChartData(response.body);
  }
}

List<LineChartData> parseChartData(String responseBody) {
  List<LineChartData> dataList = json.decode(responseBody) as List;
  return dataList.cast<Map<String, int>>().map((json) => LineChartData.fromJson(json)).toList();
}

class LineChartData {
  final DateTime period;
  final int count;

  LineChartData({this.period, this.count});

  factory LineChartData.fromJson(Map<String, int> json) {
    final count = json['number'];
    final year = json['year'];
    DateTime period = DateTime(year, 1, 1);

/*
    // проверка значений
    print(json);
    print(period);
    print(count);
*/

    return LineChartData(period: period, count: count);
  }
}
