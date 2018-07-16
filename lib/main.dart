import 'package:flutter/material.dart';
import 'package:hr_metrics/SalaryView.dart';

void main() => runApp(new MaterialApp(
  home: new MyApp(),
));

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
                        fontSize: 34.0
                    ),
                  ),
                ),
              ),
              color: Colors.lightBlueAccent,
            ),
            FlatButton(
              onPressed: goToNumberView,
              child: new SizedBox(
                height: 150.0,
                child: Center(
                  child: new Text('ЧИСЛЕННОСТЬ',
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 34.0
                    ),
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
                        fontSize: 34.0
                    ),
                  ),
                ),
              ),
              color: Colors.blue,
            ),
          ],
        ),
      );
  }

  void goToSalaryView() => print('переход на страницу зарплаты');
  void goToNumberView() => print('переход на страницу численности');
  void goToTurnoverView() => print('переход на страницу текучести');
}