import 'dart:async';

/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hr_metrics/models/bardata.dart';
import 'package:hr_metrics/models/serializers.dart';

class SimpleBars extends StatefulWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;


  SimpleBars({this.seriesList, this.animate});

/*
  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBars.withSampleData() {
    return SimpleBars(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }
*/

  @override
  SimpleBarsState createState() {
    return SimpleBarsState();
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<BarData, String>> _createSampleData(List<BarData> bardataList) {

    final data = FirebaseDatabase.instance.reference()
        .child('headcountData')
        .once()
        .then((DataSnapshot snapshot) {
      for (BarData bar in snapshot.value) {
        bardataList.add(bar);
      }
      for (int i = 0; i < bardataList.length; i++) {
        Map<String, dynamic> data = Map.from(bardataList[i] as Map);
        BarData barData =
        serializers.deserializeWith(BarData.serializer, data);
        bardataList.add(barData);
      }
    });

    return [
      charts.Series<BarData, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (BarData bars, _) => bars.period,
        measureFn: (BarData bars, _) => bars.count,
        data: data,
      )
    ];
  }
}

class SimpleBarsState extends State<SimpleBars> {
  List<BarData> bardataList = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: null,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return charts.BarChart(
                widget.seriesList,
                animate: widget.animate,
              );
            })

    );
  }
}
/*
/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
*/
