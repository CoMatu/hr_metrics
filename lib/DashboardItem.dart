// карточка для стартового дашборда приложения
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class DashboardItem extends StatelessWidget {
  const DashboardItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: доработать дизайн виджета визуально
    return SizedBox(
        height: 160.0,
        child: Card(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      ' НАЗВАНИЕ ПАНЕЛИ ',
                      style: new TextStyle(
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 3,
                      child: Column(
                        children: <Widget>[
                          Text(
                            '2818',
                            style: new TextStyle(
                                fontSize: 48.0,
                                fontFamily: 'Oswald',
                                color: Colors.deepOrange[700]),
                          ),
                          Text(
                            'чел.',
                            style: new TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Oswald',
                                color: Colors.black45),
                          )
                        ],
                      )),
                  Expanded(
                    flex: 2,
                    child: _turnoverWidget(),
                    //TODO add widget
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Widget _headcoundWidget() {
    var maleImg = new AssetImage('assets/male.png');
    var femaleImg = new AssetImage('assets/female.png');

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image(
                  image: maleImg,
                  width: 50.0,
                  height: 70.0,
                ),
                Text(
                  '1600',
                  style: new TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 16.0,
                      color: Colors.black54),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Image(
                  image: femaleImg,
                  width: 50.0,
                  height: 70.0,
                ),
                Text(
                  '1230',
                  style: new TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 16.0,
                      color: Colors.black54),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _salaryWidget() {
    return Column(
      children: <Widget>[
        Text(
          'РАБОЧИЕ',
          style: new TextStyle(
              fontSize: 12.0, fontFamily: 'Oswald', color: Colors.blue),
        ),
        Text(
          '28 787',
          style: new TextStyle(
              fontSize: 20.0, fontFamily: 'Oswald', color: Colors.black54),
        ),
        Text(
          'ИТР',
          style: new TextStyle(
              fontSize: 12.0, fontFamily: 'Oswald', color: Colors.blue),
        ),
        Text(
          '46 391',
          style: new TextStyle(
              fontSize: 20.0, fontFamily: 'Oswald', color: Colors.black54),
        ),
      ],
    );
  }

  Widget _turnoverWidget() {
    return Column(
      children: <Widget>[
        Text(
          'TITILE',
          style: new TextStyle(
              fontSize: 12.0, fontFamily: 'Oswald', color: Colors.blue),
        ),
        Text(
          '71',
          style: new TextStyle(
              fontSize: 20.0, fontFamily: 'Oswald', color: Colors.black54),
        ),
        Text(
          'УВОЛЕНО',
          style: new TextStyle(
              fontSize: 12.0, fontFamily: 'Oswald', color: Colors.redAccent),
        ),
        Text(
          '69',
          style: new TextStyle(
              fontSize: 20.0, fontFamily: 'Oswald', color: Colors.black54),
        ),
      ],
    );
  }
}
