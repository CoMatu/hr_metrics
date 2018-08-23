import 'dart:async';

/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hr_metrics/models/bardata.dart';

class SimpleBar extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  SimpleBar(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBar.withSampleData() {
    return SimpleBar(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: FutureBuilder(
          future: CreateDataBarChart.createData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return charts.BarChart(
                seriesList,
                animate: animate,
              );

            })

    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      OrdinalSales('2014', 5),
      OrdinalSales('2015', 25),
      OrdinalSales('2016', 100),
      OrdinalSales('2017', 75),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

class CreateDataBarChart {
  static Future<List<charts.Series<BarData, String>>> createData() async {
    var seriesCh = List<charts.Series<BarData, String>>();

    for (int i = 0; i < 3; i++) {
      final data = await _fetchData();
      var id = 'ChartData' + ' ' + i.toString();
      var dataChart = charts.Series<BarData, String>(
        id: id,
        domainFn: (BarData series, _) => series.period,
        measureFn: (BarData series, _) => series.count,
        data: data,
        labelAccessorFn: (BarData series, _) => '${series.count.toString()}',
        colorFn: (_, __) => null,
      );
      seriesCh.add(dataChart);
    }
    return seriesCh;
  }

  static Future<List<BarData>> _fetchData() async {
    List<BarData> bsD = List();
    FirebaseDatabase database = FirebaseDatabase.instance;
    var snapshot = await database.reference().child("headcountData").once();
    bsD = snapshot.value as List<BarData>;
    print(snapshot);
    return bsD;
  }
}
