
import 'package:flutter/material.dart';
import 'package:hr_metrics/CheckAuth.dart';

void main() {

  runApp (new MaterialApp(
    theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.white24,
        scaffoldBackgroundColor: Colors.grey[200]),
    debugShowCheckedModeBanner: false,
      home: new CheckAuth(),
      routes: <String, WidgetBuilder>{
      },
  ));
}

//TODO Сделать авторизацию
//TODO Найти АПИ 1С для запросов на обновление базы данных
//TODO Вынести настройки графиков в preferencies
//TODO вынести навигацию в файл routes