import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SalaryView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('СРЕДНЯЯ ЗАРПЛАТА'),

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: new SalaryChart.withSampleData(),
      ),
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
//TODO нужен какой-то класс который строит график и в него при вызове передаем конструктором данные для графика

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

  static List<charts.Series<OrdinalSalary, String>> _createSampleData() {
    final data = [
      new OrdinalSalary('2008', 27990),
      new OrdinalSalary('2009', 26590),
      new OrdinalSalary('2010', 27890),
      new OrdinalSalary('2011', 27890),
      new OrdinalSalary('2012', 30100),
      new OrdinalSalary('2013', 31230),
      new OrdinalSalary('2014', 31003),
      new OrdinalSalary('2015', 33001),
      new OrdinalSalary('2016', 32555),
      new OrdinalSalary('2017', 35977),
      new OrdinalSalary('2018', 32753),
    ];

    return [
      new charts.Series<OrdinalSalary, String>(
        id: 'Sales',
        domainFn: (OrdinalSalary salaries, _) => salaries.year,
        measureFn: (OrdinalSalary salaries, _) => salaries.salary,
        data: data,
        labelAccessorFn: (OrdinalSalary salaries, _) => '${salaries.salary.toString()}'
      )
    ];
  }


}

/// Sample ordinal data type.

class OrdinalSalary {
  final String year;
  final int salary;

  OrdinalSalary(this.year, this.salary);
}
