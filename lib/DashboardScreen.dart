import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hr_metrics/models/article.dart';
import 'package:hr_metrics/models/serializers.dart';


// экран дашборд с главными показателями
class DashboardScreen extends StatelessWidget {
  DashboardScreen(this.database);
  FirebaseDatabase database;

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text('ИНФОПАНЕЛЬ'),
      ),
      drawer: Drawer(
//TODO боковое меню
          ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: new FutureBuilder(
                future:
                database
                    .reference()
                    .child('article')
                    .once()
/*
                    .then((DataSnapshot snapshot) {
                      return snapshot;
                })
*/
                ,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return _getWidget(snapshot);
                  }
                     else {
                      return new CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation(Colors.yellow[700]));
                    }

                }),
          )),
    );
  }

  Widget _getWidget(AsyncSnapshot snapshot) {

//    String dashboard = '{"id" : "01", "text" : "поешь этих дурацких булочек", "title" : "название"}';
//    Map<String, dynamic> data = snapshot.data;

//    DataSnapshot data1 = snapshot.data;

    Map<String, dynamic> data = Map.from(snapshot.data.value);

    Article article = serializers.deserializeWith(Article.serializer,data);

    return new Container(
      child: new Text(article.text)
    )
    ;
  }

  // из ответа датабазы формируем список параметров объектов дашборда
/*
  List<Dashboard> parseDashboard(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Dashboard>((json) => Dashboard.fromJson(json)).toList();
  }
*/
}
