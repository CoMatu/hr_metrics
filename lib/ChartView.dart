
import 'package:flutter/material.dart';
import 'package:hr_metrics/ChartEntry.dart';
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

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: chartEntryList.length,
          padding: EdgeInsets.all(8.0),
          itemBuilder: (context, index){
            return ListItem(chartEntryList[index]);
          },
        )
      ),
    );
  }

}