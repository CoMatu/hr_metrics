import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';


class SimpleBarChart extends StatefulWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;
  final String units;

  SimpleBarChart(this.seriesList, this.units, {this.animate});

  @override
  SimpleBarChartState createState() {
    return SimpleBarChartState();
  }

}

class SimpleBarChartState extends State<SimpleBarChart> {
  String _period;
  Map<String, num> _measures;

  // Listens to the underlying selection changes, and updates the information
  // relevant to building the primitive legend like information under the
  // chart.
  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;

    String period;
    final measures = <String, num>{};

    // We get the model that updated with a list of [SeriesDatum] which is
    // simply a pair of series & datum.
    //
    // Walk the selection updating the measures map, storing off the sales and
    // series name for each selection point.
    if (selectedDatum.isNotEmpty) {
      period = selectedDatum.first.datum.period.toString();
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
    Intl.defaultLocale = 'ru';
    var f = NumberFormat();

    final children = <Widget>[
      Expanded(
          child: charts.BarChart(
            widget.seriesList,
            animate: widget.animate,
            selectionModels: [
              charts.SelectionModelConfig(
                type: charts.SelectionModelType.info,
              )
            ],
            //barRendererDecorator: new charts.BarLabelDecorator<String>(),
            vertical: true,
          ),
      )
    ];
    // If there is a selection, then include the details.
    if (_period != null) {
    }
    _measures?.forEach((String series, num value) {
      var value1 = f.format(value);
      children.add(Text('${series} $value1 '+widget.units,
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
