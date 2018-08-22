// карточка для стартового дашборда приложения
//import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:hr_metrics/models/dashboard.dart';
import 'package:intl/intl.dart';

class DashboardItem extends StatelessWidget {
  const DashboardItem(this.dashboard, {Key key}) : super(key: key);
  final Dashboard dashboard;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    Intl.defaultLocale = 'ru';
    var f = new NumberFormat();

    // TODO: доработать дизайн виджета визуально
    return SizedBox(
        height: _itemSize(screenSize),
        child: Card(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      dashboard.dashboardItemTitle,
                      style: new TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Oswald'
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
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              f.format(dashboard.mainIndicator).toString(),
                              style: new TextStyle(
                                  fontSize: 48.0,
                                  fontFamily: 'Oswald',
                                  color: _getColor()),
                            ),
                            Text(
                              dashboard.mainIndicatorUnit,
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Oswald',
                                  color: Colors.black45),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 2,
                    child: _choiseCardWidget(),
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

    Intl.defaultLocale = 'ru';
    var _f = new NumberFormat();

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
                  _f.format(dashboard.indicator1).toString(),
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
                  _f.format(dashboard.indicator2).toString(),
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
    Intl.defaultLocale = 'ru';
    var _f = new NumberFormat();

    return Column(
      children: <Widget>[
        Text(
          dashboard.indicator1Title,
          style: new TextStyle(
              fontSize: 12.0, fontFamily: 'Oswald', color: Colors.blue),
        ),
        Text(
          _f.format(dashboard.indicator1).toString(),
          style: new TextStyle(
              fontSize: 20.0, fontFamily: 'Oswald', color: Colors.black54),
        ),
        Text(
          dashboard.indicator2Title,
          style: new TextStyle(
              fontSize: 12.0, fontFamily: 'Oswald', color: Colors.blue),
        ),
        Text(
          _f.format(dashboard.indicator2).toString(),
          style: new TextStyle(
              fontSize: 20.0, fontFamily: 'Oswald', color: Colors.black54),
        ),
      ],
    );
  }

  Widget _turnoverWidget() {
    Intl.defaultLocale = 'ru';
    var _f = new NumberFormat();

    return Column(
      children: <Widget>[
        new Text(
          dashboard.indicator1Title,
          style: new TextStyle(
              fontSize: 12.0, fontFamily: 'Oswald', color: Colors.blue),
        ),
        new Text(
          _f.format(dashboard.indicator1).toString(),
          style: new TextStyle(
              fontSize: 20.0, fontFamily: 'Oswald', color: Colors.black54),
        ),
        new Text(
          dashboard.indicator2Title,
          style: new TextStyle(
              fontSize: 12.0, fontFamily: 'Oswald', color: Colors.redAccent),
        ),
        new Text(
          _f.format(dashboard.indicator2).toString(),
          style: new TextStyle(
              fontSize: 20.0, fontFamily: 'Oswald', color: Colors.black54),
        ),
      ],
    );
  }

  _choiseCardWidget() {
    var result;
    var chartType = dashboard.dashboardItemType;
    switch (chartType) {
      case 1:
        result = _headcoundWidget();
        return result;
      case 2:
        result = _salaryWidget();
        return result;
      case 3:
        result = _turnoverWidget();
        return result;
    }

  }

  _getColor() {
    var result;
    var chartType = dashboard.dashboardItemType;
    switch (chartType) {
      case 1:
        result = Colors.orange[700];
        return result;
      case 2:
        result = Colors.blue[700];
        return result;
      case 3:
        result = Colors.green[700];
        return result;
    }
  }

}

_itemSize(Size screenSize) {
  var size = (screenSize.height-100)/3;
  if(size < 175.0) {
    size = 175.0;
  }
  return size;
}
