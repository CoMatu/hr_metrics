import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class SimpleBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  factory SimpleBarChart.withData() {
    var bar = new SimpleBarChart.withData();
    return bar;
  }


  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      vertical: false,
    );
  }

}
