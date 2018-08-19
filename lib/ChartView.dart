
import 'package:flutter/material.dart';
import 'package:hr_metrics/ChartsData/ChartEntry.dart';
import 'package:hr_metrics/ListItem.dart';


class ChartView extends StatelessWidget{

/*
  final List<String> loadUrl; // ссылка на данные из интернета
  final List<String> chartTitle;

*/
  final List<ChartEntry> chartEntryList;
  final String title;

  ChartView (this.chartEntryList, this.title);

  @override
  Widget build(BuildContext context) {

    List buildChartsView(List<ChartEntry> chartEntryList, String title){
      List<Widget> items = List();
      for(int i = 0; i < chartEntryList.length; i++){
        items.add(ListItem(chartEntryList[i], chartEntryList[i].color));
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

