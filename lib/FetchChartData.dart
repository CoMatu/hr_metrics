import 'package:charts_flutter/flutter.dart' as charts;

class FetchChartData {
  static List<charts.Series<OrdinalData, String>> _createSampleData() {
    final data = [
      new OrdinalData('2008', 27990),
      new OrdinalData('2009', 26590),
      new OrdinalData('2010', 27890),
    ];

    return [
      new charts.Series<OrdinalData, String>(
          id: 'Sales',
          domainFn: (OrdinalData series, _) => series.period,
          measureFn: (OrdinalData series, _) => series.count,
          data: data,
          labelAccessorFn: (OrdinalData series, _) => '${series.count.toString()}'
      )
    ];
  }
}
class OrdinalData {
  final String period;
  final int count;

  OrdinalData(this.period, this.count);
}