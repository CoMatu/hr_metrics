import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:hr_metrics/models/bardata.dart';
import 'package:hr_metrics/models/serializers.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CreateDataBarChart {
  static Future<List<charts.Series<BarData, String>>> createData(
      List<String> databaseRefName, List<charts.Color> color, List<String> id) async {
    var seriesCh = List<charts.Series<BarData, String>>();

    for (int i = 0; i < databaseRefName.length; i++) {
      final data = await _fetchData(databaseRefName[i]);
      var dataChart = charts.Series<BarData, String>(
        id: id[i],
        domainFn: (BarData series, _) => series.period,
        measureFn: (BarData series, _) => series.count,
        data: data,
        labelAccessorFn: (BarData series, _) => '${series.count.toString()}',
        colorFn: (_, __) => color[i],
      );
      seriesCh.add(dataChart);
    }
    return seriesCh;
  }

  static Future<List<BarData>> _fetchData(String loadUrl) async {
    List snapdata = List();
    List<BarData> bardataList = List();
    FirebaseDatabase database = FirebaseDatabase.instance;
    var snapshot = await database.reference().child(loadUrl).once();

    for (var value in snapshot.value) {
      snapdata.add(value);
    }
    for (int i = 0; i < snapdata.length; i++) {
      Map<String, dynamic> data = Map.from(snapdata[i] as Map);
      BarData barData =
      serializers.deserializeWith(BarData.serializer, data);
      bardataList.add(barData);
    }
    return bardataList;
  }

/*
  static Future<List<ChartData>> _fetchData(
      http.Client client, String loadUrl) async {
    final response = await client.get(loadUrl);

//    return compute(parseChartData, response.body); выдает ошибку
    return parseChartData(response.body);
  }
*/
}

/*
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
*/
