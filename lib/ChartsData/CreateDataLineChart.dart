import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:hr_metrics/models/bardata.dart';
import 'package:hr_metrics/models/linedata.dart';
import 'package:hr_metrics/models/serializers.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CreateDataLineChart {
  static Future<List<charts.Series<LineData, DateTime>>> createData(
      List<String> databaseRefName, List<charts.Color> color) async {
    var seriesData = List<charts.Series<LineData, DateTime>>();

    for (int i = 0; i < databaseRefName.length; i++) {
      final data = await _fetchData(databaseRefName[i]);
      var id = 'ChartData' + ' ' + i.toString();

      seriesData.add(charts.Series<LineData, DateTime>(
        id: id,
        domainFn: (LineData series, _) => series.period,
        measureFn: (LineData series, _) => series.count,
        data: data,
        labelAccessorFn: (LineData series, _) => '${series.count
            .toString()}',
        colorFn: (_, __) => color[i],
      ));
    }
    return seriesData;
  }

  static Future<List<LineData>> _fetchData(String loadUrl) async {
    List snapdata = List();
    List<LineData> linedataList = List();
    FirebaseDatabase database = FirebaseDatabase.instance;
    var snapshot = await database.reference().child(loadUrl).once();

    for (var value in snapshot.value) {
      snapdata.add(value);
    }
    for (int i = 0; i < snapdata.length; i++) {
      Map<String, dynamic> data = Map.from(snapdata[i] as Map);
      BarData barData =
      serializers.deserializeWith(BarData.serializer, data);
      var year = int.parse(barData.period);
      DateTime period = DateTime(year, 1, 1);
      LineData lineData = LineData(
          period: period,
          count: barData.count.toDouble()
      );
      linedataList.add(lineData);
    }
    return linedataList;

  }
}

/*
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

*/
/*
    // проверка значений
    print(json);
    print(period);
    print(count);
*//*


    return LineChartData(period: period, count: count);
  }
}
*/
