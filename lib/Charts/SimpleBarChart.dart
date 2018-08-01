import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class SimpleBarChart extends StatefulWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  factory SimpleBarChart.withData() {
    var bar = new SimpleBarChart.withData();
    return bar;
  }


  @override
  SimpleBarChartState createState() {
    return new SimpleBarChartState();
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
      period = selectedDatum.first.datum.period;
      selectedDatum.forEach((charts.SeriesDatum datumPair) {
        measures[datumPair.series.displayName] = datumPair.datum.count;
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
    final children = <Widget>[
      new Expanded(
          child: new charts.BarChart(
            widget.seriesList,
            animate: widget.animate,
            selectionModels: [
              new charts.SelectionModelConfig(
                type: charts.SelectionModelType.info,
                listener: _onSelectionChanged,
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
      children.add(new Text('$value',
      style: new TextStyle(
        fontSize: 16.0,
        color: Colors.cyan[800]
      ),));
    });

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: new Column(children: children),
    );
  }

}
