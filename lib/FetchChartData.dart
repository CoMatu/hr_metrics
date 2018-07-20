import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:charts_flutter/flutter.dart' as charts;

class FetchChartData {
  static Future<List<charts.Series<ChartData, String>>> _createSampleData() async {
    final data = await fetchData(http.Client());

    return [
      new charts.Series<ChartData, String>(
          id: 'Sales',
          domainFn: (ChartData series, _) => series.period,
          measureFn: (ChartData series, _) => series.count,
          data: data,
          labelAccessorFn: (ChartData series, _) => '${series.count.toString()}'
      )
    ];
  }
}

Future<List<ChartData>> fetchData(http.Client client) async {
  final response =
  await client.get('http://skazkimal.ru/hr-metrics/headcount.json');

  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parseChartData, response.body);
}

// A function that will convert a response body into a List<Photo>
List<ChartData> parseChartData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<ChartData>((json) => ChartData.fromJson(json)).toList();
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