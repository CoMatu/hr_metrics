import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

class CreateDataDonutChart {
  static Future<List<charts.Series<DonutChartData, String>>> createData(
      List<String> loadUrl, var color) async {
    var seriesData = List<charts.Series<DonutChartData, String>>();

    for (int i = 0; i < loadUrl.length; i++) {
      final data = await _fetchData(http.Client(), loadUrl[i]);
      var id = 'ChartData' + ' ' + i.toString();

      seriesData.add(new charts.Series<DonutChartData, String>(
        id: id,
        domainFn: (DonutChartData series, _) => series.period,
        measureFn: (DonutChartData series, _) => series.count,
        data: data,
        labelAccessorFn: (DonutChartData series, _) =>
            '${series.count.toString()}',
      ));
    }
    return seriesData;
  }

  static Future<List<DonutChartData>> _fetchData(
      http.Client client, String loadUrl) async {
    final response = await client.get(loadUrl);

//    return compute(parseChartData, response.body); выдает ошибку
    return parseChartData(response.body);
  }
}

List<DonutChartData> parseChartData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<DonutChartData>((json) => DonutChartData.fromJson(json))
      .toList();
}

class DonutChartData {
  final String period;
  final int count;

  DonutChartData({this.period, this.count});

  factory DonutChartData.fromJson(Map<String, dynamic> json) {
    final count = json['number'];
    final period = json['year'];

/*
    // проверка значений
    print(json);
    print(period);
    print(count);
*/

    return DonutChartData(period: period, count: count);
  }
}
