import 'package:charts_common/src/data/series.dart';
import 'package:flutter/material.dart';
import 'package:hr_metrics/SimpleBarChart.dart';
import 'package:hr_metrics/FetchChartData.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class TurnoverView extends StatelessWidget{
  final List<charts.Series> seriesList;



  const TurnoverView({Key key, this.seriesList}) : super(key: key);

  get fetchChartData => new FetchChartData();

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('СРЕДНЯЯ ЗАРПЛАТА'),

      ),
      body: FutureBuilder(
        future: fetchChartData,
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return new Text('Data is loading...');
            }
            else{
              return new SimpleBarChart(seriesList);
            }
          },
      ),
    );
  }

}