import 'package:hr_metrics/ChartEntry.dart';
import 'package:hr_metrics/ChartView.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


List<ChartEntry> dataSalary = [
  new ChartEntry(
      10,
      'http://skazkimal.ru/hr-metrics/salary.json',
      'Средняя зарплата, руб.',
      charts.MaterialPalette.deepOrange.shadeDefault),//chart color
  new ChartEntry(
      10,
      'http://skazkimal.ru/hr-metrics/salaryWorkers.json',
      'Средняя зарплата рабочих, руб.',
      charts.MaterialPalette.deepOrange.shadeDefault),
  new ChartEntry(
      10,
      'http://skazkimal.ru/hr-metrics/salaryITR.json',
      'Средняя зарплата ИТР, руб.',
      charts.MaterialPalette.deepOrange.shadeDefault)
];

List<ChartEntry> dataHeadcount = [
  new ChartEntry(
      10,
      'http://skazkimal.ru/hr-metrics/headcount.json',
      'Численность, чел.',
      charts.MaterialPalette.blue.shadeDefault),
];
List<ChartEntry> dataTurnover = [
  new ChartEntry(
      10,
      'http://skazkimal.ru/hr-metrics/turnover.json',
      'Текучесть кадров, %',
      charts.MaterialPalette.pink.shadeDefault),
];
List<ChartEntry> dataFot = [
  new ChartEntry(
      10,
      'http://skazkimal.ru/hr-metrics/fot.json',
      'Фонд оплаты труда, тыс.руб.',
      charts.MaterialPalette.cyan.shadeDefault),
];

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
                          dataSalary,
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
                            dataHeadcount,
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
                          dataTurnover,
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
                          dataFot,
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