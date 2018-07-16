import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SalaryView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final title = 'SALARY';
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(),
      body: new SalaryChart.withSampleData()
    );
  }

}

class SalaryChart extends StatelessWidget{
  final List<charts.Series> seriesList;
  final bool animate;

  SalaryChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SalaryChart.withSampleData() {
    return new SalaryChart(
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
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('2011', 27890),
      new OrdinalSales('2012', 30100),
      new OrdinalSales('2013', 31230),
      new OrdinalSales('2014', 31003),
      new OrdinalSales('2015', 33001),
      new OrdinalSales('2016', 32555),
      new OrdinalSales('2017', 35977),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
       labelAccessorFn: (OrdinalSales sales, _) =>
       '${sales.year}: \$${sales.sales.toString()}',
        outsideLabelStyleAccessorFn: (OrdinalSales sales, _) {
          final color = charts.MaterialPalette.black;
          return new charts.TextStyleSpec(color: color);
        }
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