import 'package:hr_metrics/ChartsData/ChartEntry.dart';
import 'package:hr_metrics/ChartView.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hr_metrics/DashboardScreen.dart';
import 'package:hr_metrics/StartScreen.dart';

List<ChartEntry> dataSalary = [
  new ChartEntry(
      20,
      ['http://skazkimal.ru/hr-metrics/salary.json'],
      'Средняя зарплата, руб.',
      [charts.MaterialPalette.deepOrange.shadeDefault],
      'руб.'), //chart color
  new ChartEntry(
      10,
      ['http://skazkimal.ru/hr-metrics/salaryWorkers.json'],
      'Средняя зарплата рабочих, руб.',
      [charts.MaterialPalette.green.shadeDefault],
      'руб.'),
  new ChartEntry(
      10,
      ['http://skazkimal.ru/hr-metrics/salaryITR.json'],
      'Средняя зарплата ИТР, руб.',
      [charts.MaterialPalette.gray.shadeDefault],
      'руб.'),
  new ChartEntry(
      10,
      [
        'http://skazkimal.ru/hr-metrics/salaryITR.json',
        'http://skazkimal.ru/hr-metrics/salaryWorkers.json'
      ],
      'Сравнение ИТР рабочие, руб.',
      [
        charts.MaterialPalette.blue.shadeDefault,
        charts.MaterialPalette.green.shadeDefault
      ],
      'руб.')
];

List<ChartEntry> dataHeadcount = [
  new ChartEntry(10, ['http://skazkimal.ru/hr-metrics/headcount.json'],
      'Численность, чел.', [charts.MaterialPalette.blue.shadeDefault], 'чел.'),
];
List<ChartEntry> dataTurnover = [
  new ChartEntry(20, ['http://skazkimal.ru/hr-metrics/turnover.json'],
      'Текучесть кадров, %', [charts.MaterialPalette.pink.shadeDefault], '%'),
];
List<ChartEntry> dataFot = [
  new ChartEntry(
      10,
      ['http://skazkimal.ru/hr-metrics/fot.json'],
      'Фонд оплаты труда, тыс.руб.',
      [charts.MaterialPalette.cyan.shadeDefault],
      'тыс.руб.'),
];

void main() => runApp(new MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          accentColor: Colors.white24,
          scaffoldBackgroundColor: Colors.grey[200]),
      debugShowCheckedModeBanner: false,
      home: new MyApp(),
//      home: new DashboardScreen(),
    ));
//TODO Сделать авторизацию
//TODO Найти АПИ 1С для запросов на обновление базы данных
//TODO Сделать текучесть кадров в дробных процентах
//TODO Вынести настройки графиков в preferencies
//TODO вынести навигацию в файл routes

class MyApp extends StatelessWidget {
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChartView(dataSalary, 'ЗАРПЛАТА')),
              );
            },
            child: new SizedBox(
              height: 120.0,
              child: Center(
                child: new Text(
                  'ЗАРПЛАТА',
                  style: new TextStyle(color: Colors.white, fontSize: 30.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            color: Colors.orange[800],
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ChartView(dataHeadcount, 'ЧИСЛЕННОСТЬ')),
              );
            },
            child: new SizedBox(
              height: 120.0,
              child: Center(
                child: new Text(
                  'ЧИСЛЕННОСТЬ',
                  style: new TextStyle(color: Colors.white, fontSize: 30.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            color: Colors.blue[800],
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ChartView(dataTurnover, 'ТЕКУЧЕСТЬ КАДРОВ')),
              );
            },
            child: new SizedBox(
              height: 120.0,
              child: Center(
                child: new Text(
                  'ТЕКУЧЕСТЬ',
                  style: new TextStyle(color: Colors.white, fontSize: 30.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            color: Colors.pink[400],
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ChartView(dataFot, 'ФОНД ОПЛАТЫ ТРУДА')),
              );
            },
            child: new SizedBox(
              height: 120.0,
              child: Center(
                child: new Text(
                  'ФОНД ОПЛАТЫ ТРУДА',
                  style: new TextStyle(color: Colors.white, fontSize: 30.0),
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