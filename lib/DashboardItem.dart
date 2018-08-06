// карточка для стартового дашборда приложения
import 'package:flutter/material.dart';

class DashboardItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: доработать дизайн виджета визуально
    return SizedBox(
      height: 160.0,
      child: Card(
        child: Column(
          children: <Widget>[
            Text(' НАЗВАНИЕ ПАНЕЛИ '),
            Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Text(
                            '2018',
                          style: new TextStyle(
                            fontSize: 48.0,
                            fontFamily: 'Oswald',
                            color: Colors.deepOrange[400]
                          ),
                        ),
                        Text(
                          'units',
                          style: new TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Oswald',
                            color: Colors.black45
                          ),
                        )
                      ],
                    )
                )
              ],
            )
          ],
        ),
      )
    );
  }

}