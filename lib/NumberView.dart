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
      new OrdinalNumber(year: '2010', number: 3195),
      new OrdinalNumber(year: '2011', number: 3159),
      new OrdinalNumber(year: '2012', number: 3094),
      new OrdinalNumber(year: '2013', number: 2878),
      new OrdinalNumber(year: '2014', number: 2784),
      new OrdinalNumber(year: '2015', number: 2655),
      new OrdinalNumber(year: '2016', number: 2650),
      new OrdinalNumber(year: '2017', number: 2742),
      new OrdinalNumber(year: '2018', number: 2766),
    ];

    return [
      new charts.Series<OrdinalNumber, String>(
          id: 'Numbers',
          domainFn: (OrdinalNumber numbers, _) => numbers.year,
          measureFn: (OrdinalNumber numbers, _) => numbers.number,
          data: data,
          labelAccessorFn: (OrdinalNumber numbers, _) => '${numbers.number.toString()}'
      )
    ];
  }

}

class OrdinalNumber {
  final String year;
  final int number;

  OrdinalNumber({this.year, this.number});
  }

