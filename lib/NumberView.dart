import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class NumberView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: добавить график
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('СРЕДНЕСПИСОЧНАЯ ЧИСЛЕННОСТЬ'),

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: new NumberChart.withSampleData(),
      ),
    );
  }

}

class NumberChart extends StatelessWidget{
  final List<charts.Series> seriesList;
  final bool animate;

  NumberChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory NumberChart.withSampleData() {
    return new NumberChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }


  @override
  Widget build(BuildContext context) {
    // This is just a simple bar chart with optional property
    // [defaultInteractions] set to true to include the default
    // interactions/behaviors when building the chart.
    // This includes bar highlighting.
    //
    // Note: defaultInteractions defaults to true.
    //
    // [defaultInteractions] can be set to false to avoid the default
    // interactions.
    return new charts.BarChart(
      seriesList,
      animate: animate,
      defaultInteractions: true,
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      vertical: false,
    );
  }
//TODO Сделать базу данных
  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalNumber, String>> _createSampleData() {
    final data = [
      new OrdinalNumber('2008', 2799),
      new OrdinalNumber('2009', 2659),
      new OrdinalNumber('2010', 2789),
      new OrdinalNumber('2011', 2789),
      new OrdinalNumber('2012', 3010),
      new OrdinalNumber('2013', 3123),
      new OrdinalNumber('2014', 3103),
      new OrdinalNumber('2015', 3301),
      new OrdinalNumber('2016', 3255),
      new OrdinalNumber('2017', 3597),
    ];

    return [
      new charts.Series<OrdinalNumber, String>(
          id: 'Sales',
          domainFn: (OrdinalNumber sales, _) => sales.year,
          measureFn: (OrdinalNumber sales, _) => sales.number,
          data: data,
          labelAccessorFn: (OrdinalNumber sales, _) => '${sales.number.toString()}'
      )
    ];
  }

}

/// Sample ordinal data type.
class OrdinalNumber {
  final String year;
  final int number;

  OrdinalNumber(this.year, this.number);
}