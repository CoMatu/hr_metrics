import 'package:hr_metrics/ChartView.dart';

import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  theme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    accentColor: Colors.white24,
    scaffoldBackgroundColor: Colors.grey[200]
  ),
  debugShowCheckedModeBanner: false,
  home: new MyApp(),
));
//TODO Сделать авторизацию
//TODO Сделать загрузку информации с сервера
//TODO Найти АПИ 1С для запросов на обновление базы данных
//TODO Сделать текучесть кадров в дробных процентах

class MyApp extends StatelessWidget {
  //списки адресов загрузки файлов
  final List<String> headcountLoadUrl = [
    'http://skazkimal.ru/hr-metrics/headcount.json'
  ];
  final List<String> salaryLoadUrl = [
    'http://skazkimal.ru/hr-metrics/salary.json',
    'http://skazkimal.ru/hr-metrics/salaryWorkers.json',
    'http://skazkimal.ru/hr-metrics/salaryITR.json'
  ];
  final List<String> turnoverLoadUrl = [
    'http://skazkimal.ru/hr-metrics/turnover.json'
  ];
  final List<String> fotLoadUrl = [
    'http://skazkimal.ru/hr-metrics/fot.json'
  ];
  //заголовки графиков, количество равно списку url!!!
  final List<String> headcountTitles = [
    'Численность, чел.',
  ];  final List<String> salaryTitles = [
    'Средняя зарплата, руб.',
    'Средняя зарплата рабочих, руб.',
    'Средняя зарплата ИТР, руб.'
  ];  final List<String> turnoverTitles = [
    'Текучесть кадров, %',
  ];  final List<String> fotTitles = [
    'Фонд оплаты труда, тыс.руб.',
  ];

  @override
  Widget build(BuildContext context) {
    final title = 'HR METRICS';

    return new Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        //сделано обычными элементами списка, чтобы легче кастомизировать
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      ChartView(
                          salaryLoadUrl,
                          salaryTitles,
                          'СРЕДНЯЯ ЗАРПЛАТА'
                      )
                  ),
                );
              },
              child: new SizedBox(
                height: 120.0,
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
              color: Colors.orange[800],
            ),
            FlatButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        ChartView(
                            headcountLoadUrl,
                            headcountTitles,
                            'СРЕДНЕСПИСОЧНАЯ ЧИСЛЕННОСТЬ'
                        )
                    ),
                );
              },
              child: new SizedBox(
                height: 120.0,
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
              color: Colors.blue[800],
            ),
            FlatButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      ChartView(
                          turnoverLoadUrl,
                          turnoverTitles,
                          'ТЕКУЧЕСТЬ КАДРОВ'
                      )
                  ),
                );
              },
              child: new SizedBox(
                height: 120.0,
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
              color: Colors.pink[400],
            ),
            FlatButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      ChartView(
                          fotLoadUrl,
                          fotTitles,
                          'ФОНД ОПЛАТЫ ТРУДА'
                      )
                  ),
                );
              },
              child: new SizedBox(
                height: 120.0,
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
              color: Colors.cyan[800],
            ),
          ],
        ),
      );
  }

}