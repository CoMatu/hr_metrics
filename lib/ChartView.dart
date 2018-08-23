
import 'package:flutter/material.dart';
import 'package:hr_metrics/ChartsData/ChartEntry.dart';
import 'package:hr_metrics/ListItem.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class ChartView extends StatelessWidget{
  final List<ChartEntry> chartEntryList;
  final String title;
  final List<charts.Color> color;

  ChartView (this.chartEntryList, this.title, {this.color});

  @override
  Widget build(BuildContext context) {

    List<Widget> buildChartsView(List<ChartEntry> chartEntryList, String title){
      List<Widget> items = List();
      for(int i = 0; i < chartEntryList.length; i++){
        items.add(ListItem(chartEntryList[i], color));
      }
      return items;
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(title),
          ),
          SliverList(delegate: SliverChildListDelegate(buildChartsView(chartEntryList, title)))
        ],
      )

    );
  }
}

