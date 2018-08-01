import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

class CreateDataLineChart {

  static Future<List<charts.Series<LineChartData, DateTime>>> createData(String loadUrl, var color) async {
    final data = await _fetchData(http.Client(), loadUrl);

    return [
      new charts.Series<LineChartData, DateTime>(
        id: 'Chart Data',
        domainFn: (LineChartData series, _) => series.period,
        measureFn: (LineChartData series, _) => series.count,
        data: data,
        labelAccessorFn: (LineChartData series, _) => '${series.count.toString()}',
        colorFn: (_, __) => color,
      )
    ];
  }

  static Future<List<LineChartData>> _fetchData(http.Client client, String loadUrl) async {
    final response = await client.get(loadUrl);

//    return compute(parseChartData, response.body); выдает ошибку
    return parseChartData(response.body);
  }

}

List<LineChartData> parseChartData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<LineChartData>((json) => LineChartData.fromJson(json)).toList();
}

class LineChartData {
  final DateTime period;
  final int count;

  LineChartData({this.period, this.count});

  factory LineChartData.fromJson(Map<String, dynamic> json) {
    final count = json['number'];
    final year = int.parse(json['year']);
    DateTime period = new DateTime(year, 1, 1);

/*
    // проверка значений
    print(json);
    print(period);
    print(count);
*/

    return LineChartData(
        period: period,
        count: count
    );
  }
}