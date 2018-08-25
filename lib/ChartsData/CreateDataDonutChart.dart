import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:hr_metrics/models/bardata.dart';
import 'package:hr_metrics/models/donutdata.dart';
import 'package:hr_metrics/models/serializers.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CreateDataDonutChart {
  static Future<List<charts.Series<DonutData, String>>> createData(
      List<String> databaseRefName, List<charts.Color> color) async {
    var seriesData = List<charts.Series<DonutData, String>>();

    for (int i = 0; i < databaseRefName.length; i++) {
      final data = await _fetchData(databaseRefName[i]);
      var id = 'ChartData' + ' ' + i.toString();

      seriesData.add(charts.Series<DonutData, String>(
        id: id,
        domainFn: (DonutData series, _) => series.period.toString(),
        measureFn: (DonutData series, _) => series.count,
        data: data,
        labelAccessorFn: (DonutData series, _) =>
            '${series.count.toString()}',
//        colorFn: (_, __) => color[i],
      ));
    }
    return seriesData;
  }


  static Future<List<DonutData>> _fetchData(String loadUrl) async {
    List snapdata = List();
    List<DonutData> donutdataList = List();
    FirebaseDatabase database = FirebaseDatabase.instance;
    var snapshot = await database.reference().child(loadUrl).once();

    for (var value in snapshot.value) {
      snapdata.add(value);
    }
    for (int i = 0; i < snapdata.length; i++) {
      Map<String, dynamic> data = Map.from(snapdata[i] as Map);
      BarData barData =
      serializers.deserializeWith(BarData.serializer, data);
      var periodD = int.parse(barData.period);
      var countD = barData.count.toInt(); // без округления!!! подавать только целые числа
      DonutData donutData = DonutData(
          countD, periodD);
      donutdataList.add(donutData);
    }
    return donutdataList;

  }
}
/*
List<DonutChartData> parseChartData(String responseBody) {
  List<DonutChartData> dataList = json.decode(responseBody) as List;
  return dataList.cast<Map<String, int>>().map((json) => DonutChartData.fromJson(json)).toList();
}

class DonutChartData {
  final int period;
  final int count;

  DonutChartData({this.period, this.count});

  factory DonutChartData.fromJson(Map<String, int> json) {
    final count = json['number'];
    final period = json['year'];

*/
/*
    // проверка значений
    print(json);
    print(period);
    print(count);
*//*


    return DonutChartData(period: period, count: count);
  }
}
*/
