import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hr_metrics/FetchChartData.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hr_metrics/ListItem.dart';
import 'package:hr_metrics/MonthView.dart';
import 'package:hr_metrics/SimpleBarChart.dart';
import 'package:http/http.dart' as http;

class ChartView extends StatelessWidget{

  final String loadUrl; // ссылка на данные из интернета
  final String title;

  ChartView (this.loadUrl, this.title);

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: selectedChart,
            itemBuilder: (BuildContext context) {
            return choices.map((Choice choice) {
              return PopupMenuItem<Choice>(
                value: choice,
                child: Text(choice.title),
              );
            }).toList();
          },

          )
        ],
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            ListItem(loadUrl, title)
          ],
        )
      ),
    );
  }

     static Future<List<charts.Series<ChartData, String>>> _createData(String loadUrl) async {
      final data = await FetchChartData(loadUrl).fetchData(http.Client());

      return [
        new charts.Series<ChartData, String>(
            id: 'Chart Data',
            domainFn: (ChartData series, _) => series.period,
            measureFn: (ChartData series, _) => series.count,
            data: data,
            labelAccessorFn: (ChartData series, _) => '${series.count.toString()}'
        )
      ];
    }

  void selectedChart(Choice value) {
    String gr = value.title;
print('Вы выбрали: $gr');
  }
}

_popupSelected(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>
        MonthView()),
  );

}
// объект для верхнего меню
class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'По категориям', icon: Icons.directions_car),
  const Choice(title: 'По месяцам', icon: Icons.directions_bike),
];
