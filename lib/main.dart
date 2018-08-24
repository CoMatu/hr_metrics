
import 'dart:async';
import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hr_metrics/CheckAuth.dart';

Future<void> main() async{

  await FirebaseApp.configure(
    name: 'hr-metrics',
    options: Platform.isIOS
      ? const FirebaseOptions(
      googleAppID: '1:525720506365:ios:d34af888671c6927',
      gcmSenderID: '525720506365',
      databaseURL: 'https://hr-metrics-85b07.firebaseio.com/'
    )
    : const FirebaseOptions(
        apiKey: 'AIzaSyCkbkGrtOChRiDsrRvp_kzMJn_VZqI9M7U',
        databaseURL: 'https://hr-metrics-85b07.firebaseio.com/',
        googleAppID: '1:525720506365:android:dd3d45e37ad67662'),
  );

  runApp (MaterialApp(
    theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.white24,
        scaffoldBackgroundColor: Colors.grey[200]),
    debugShowCheckedModeBanner: false,
      home:
      CheckAuth(),
      routes: <String, WidgetBuilder>{
      },
  ));
}

//TODO Найти АПИ 1С для запросов на обновление базы данных
//TODO Вынести настройки графиков в preferencies
//TODO вынести навигацию в файл routes