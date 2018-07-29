
import 'package:flutter/material.dart';
import 'package:hr_metrics/ListItem.dart';
import 'package:hr_metrics/MonthView.dart';

class ChartView extends StatelessWidget{

  final List<String> loadUrl; // ссылка на данные из интернета
  final List<String> chartTitle;
  final String title;

  ChartView (this.loadUrl, this.chartTitle, this.title);

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
        child: ListView.builder(
          itemCount: loadUrl.length,
          padding: EdgeInsets.all(8.0),
          itemBuilder: (context, index){
            return ListItem(loadUrl[index], chartTitle[index]);
          },
        )
      ),
    );
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
