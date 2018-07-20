import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:charts_flutter/flutter.dart' as charts;

class FetchChartData {
  static List<charts.Series<OrdinalData, String>> _createSampleData() {
    final data = [
      new OrdinalData('2008', 27990),
      new OrdinalData('2009', 26590),
      new OrdinalData('2010', 27890),
    ];

    return [
      new charts.Series<OrdinalData, String>(
          id: 'Sales',
          domainFn: (OrdinalData series, _) => series.period,
          measureFn: (OrdinalData series, _) => series.count,
          data: data,
          labelAccessorFn: (OrdinalData series, _) => '${series.count.toString()}'
      )
    ];
  }
}
class OrdinalData {
  final String period;
  final int count;

  OrdinalData(this.period, this.count);
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
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  ChartData({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory ChartData.fromJson(Map<String, dynamic> json) {
    return ChartData(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}