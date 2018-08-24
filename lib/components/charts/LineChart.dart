import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class LineChart extends StatefulWidget {
  final List<charts.Series<dynamic, DateTime>> seriesList;
  final bool animate;
  final String units;


  LineChart(this.seriesList, this.units, {this.animate});

/*
  factory LineChart.withData() {
    var bar = LineChart.withData();
    return bar;
  }
*/

  @override
  LineChartState createState() {
    return LineChartState();
  }

}

class LineChartState extends State<LineChart> {
  String _period;
  Map<String, num> _measures;

  var localDateFormat = initializeDateFormatting("ru_RU");

  // Listens to the underlying selection changes, and updates the information
  // relevant to building the primitive legend like information under the
  // chart.
  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;

    String period;
    final measures = <String, num>{};

    var dateFormat = DateFormat.y();


    // We get the model that updated with a list of [SeriesDatum] which is
    // simply a pair of series & datum.
    //
    // Walk the selection updating the measures map, storing off the sales and
    // series name for each selection point.
    if (selectedDatum.isNotEmpty) {
      period = dateFormat.format(selectedDatum.first.datum.period as DateTime);
      selectedDatum.forEach((charts.SeriesDatum datumPair) {
        measures[datumPair.series.displayName] = datumPair.datum.count as num;
      });
    }

    // Request a build.
    setState(() {
      _period = period;
      _measures = measures;
    });
  }

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat();

    final children = <Widget>[
      Expanded(
          child: charts.TimeSeriesChart(
            widget.seriesList,
            animate: widget.animate,
            selectionModels: [
              charts.SelectionModelConfig(
                type: charts.SelectionModelType.info,
                listener: _onSelectionChanged,
              )
            ],
            dateTimeFactory: const charts.LocalDateTimeFactory(),
            //barRendererDecorator: new charts.BarLabelDecorator<String>(),
          ),

      )
    ];
    // If there is a selection, then include the details.
    if (_period != null) {

      children.add(Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Text(_period+' год')));

    }
    _measures?.forEach((String series, num value) {
      var value1 = f.format(value);
      children.add(Text('$value1 '+widget.units,
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.cyan[800]
      ),));
    });

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(children: children),
    );
  }

}
