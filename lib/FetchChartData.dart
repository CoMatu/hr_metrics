import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class FetchChartData {
  final String loadUrl;

  FetchChartData(this.loadUrl);

  Future<List<ChartData>> fetchData(http.Client client) async {
    final response =
    await client.get(loadUrl);

    // Use the compute function to run parsePhotos in a separate isolate
//    return compute(parseChartData, response.body); выдает ошибку
  return parseChartData(response.body);
  }
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