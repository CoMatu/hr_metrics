import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:hr_metrics/NumberView.dart';
import 'package:hr_metrics/SalaryView.dart';

void main() => runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,
  home: new MyApp(),
));
//TODO Сделать авторизацию
//TODO Сделать загрузку информации с сервера
//TODO Найти АПИ 1С для запросов на обновление базы данных

class MyApp extends StatelessWidget {

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
                  MaterialPageRoute(builder: (context) => SalaryView()),
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
                    MaterialPageRoute(builder: (context) => NumberView()),
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
              onPressed: goToTurnoverView,
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
              onPressed: goToTurnoverView,
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