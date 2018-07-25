import 'package:hr_metrics/ChartView.dart';

import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,
  home: new MyApp(),
));
//TODO Сделать авторизацию
//TODO Сделать загрузку информации с сервера
//TODO Найти АПИ 1С для запросов на обновление базы данных

class MyApp extends StatelessWidget {
  final String headcountLoadUrl = 'http://skazkimal.ru/hr-metrics/headcount.json';
  final String salaryLoadUrl = 'http://skazkimal.ru/hr-metrics/headcount.json';
  final String turnoverLoadUrl = 'http://skazkimal.ru/hr-metrics/headcount.json';
  final String fotLoadUrl = 'http://skazkimal.ru/hr-metrics/headcount.json';

  @override
  Widget build(BuildContext context) {
    final title = 'HR METRICS';

    return new Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      ChartView(salaryLoadUrl, 'СРЕДНЯЯ ЗАРПЛАТА')),
                );
              },
              child: new SizedBox(
                height: 150.0,
                child: Center(
                  child: new Text('ЗАРПЛАТА',
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 30.0
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              color: Colors.lightBlueAccent,
            ),
            FlatButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        ChartView(headcountLoadUrl, 'СРЕДНЕСПИСОЧНАЯ ЧИСЛЕННОСТЬ')),
                );
              },
              child: new SizedBox(
                height: 150.0,
                child: Center(
                  child: new Text('ЧИСЛЕННОСТЬ',
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 30.0
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              color: Colors.lightBlue,
            ),
            FlatButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChartView(turnoverLoadUrl,
                  'ТЕКУЧЕСТЬ КАДРОВ')),
                );
              },
              child: new SizedBox(
                height: 150.0,
                child: Center(
                  child: new Text('ТЕКУЧЕСТЬ',
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 30.0
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChartView(fotLoadUrl,
                      'ФОНД ОПЛАТЫ ТРУДА')),
                );
              },
              child: new SizedBox(
                height: 150.0,
                child: Center(
                  child: new Text('ФОНД ОПЛАТЫ ТРУДА',
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 30.0
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              color: Colors.blueAccent,
            ),
          ],
        ),
      );
  }

  void goToSalaryView() => print('переход на страницу зарплаты');
  void goToNumberView() => print('переход на страницу численности');
  void goToTurnoverView() => print('переход на страницу текучести');
}