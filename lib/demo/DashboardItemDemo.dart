// карточка для стартового дашборда приложения
//import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:hr_metrics/screens/ChartView.dart';
import 'package:hr_metrics/demo/DashboardScreenDemo.dart';
import 'package:hr_metrics/models/dashboard.dart';
import 'package:intl/intl.dart';

class DashboardItemDemo extends StatelessWidget {
  const DashboardItemDemo(this.dashboard, {Key key}) : super(key: key);
  final Dashboard dashboard;

  @override
  Widget build(BuildContext context) {

    Intl.defaultLocale = 'ru';
    var f = NumberFormat();

    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text(
                  dashboard.dashboardItemTitle,
                  style: TextStyle(
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
                        FlatButton(
                          child: Text(
                            f.format(dashboard.mainIndicator).toString(),
                            style: TextStyle(
                                fontSize: 44.0,
                                fontFamily: 'Oswald',
                                color: _getColor()),
                          ),
                          onPressed: (){
                            _getRoute(context);
                          },
                        ),
                        Text(
                          dashboard.mainIndicatorUnit,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Oswald',
                              color: Colors.black45),
                        )
                      ],
                    ),
                  )),
              Expanded(
                flex: 2,
                child: _choiceCardWidget(),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _headcoundWidget(_f) {
    var maleImg = AssetImage('assets/male.png');
    var femaleImg = AssetImage('assets/female.png');
    Intl.defaultLocale = 'ru';

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
                  style: TextStyle(
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
                  style: TextStyle(
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

  Widget _salaryWidget(_f) {
    Intl.defaultLocale = 'ru';

    return Column(
      children: <Widget>[
        Text(
          dashboard.indicator1Title,
          style: TextStyle(
              fontSize: 14.0, fontFamily: 'Oswald', color: Colors.blue),
        ),
        Text(
          _f.format(dashboard.indicator1).toString(),
          style: TextStyle(
              fontSize: 20.0, fontFamily: 'Oswald', color: Colors.black54),
        ),
        Text(
          dashboard.indicator2Title,
          style: TextStyle(
              fontSize: 14.0, fontFamily: 'Oswald', color: Colors.blue),
        ),
        Text(
          _f.format(dashboard.indicator2).toString(),
          style: TextStyle(
              fontSize: 20.0, fontFamily: 'Oswald', color: Colors.black54),
        ),
      ],
    );
  }

  Widget _turnoverWidget(_f) {
    Intl.defaultLocale = 'ru';
    return Column(
      children: <Widget>[
        Text(
          dashboard.indicator1Title,
          style: TextStyle(
              fontSize: 14.0, fontFamily: 'Oswald', color: Colors.blue),
        ),
        Text(
          _f.format(dashboard.indicator1).toString(),
          style: TextStyle(
              fontSize: 20.0, fontFamily: 'Oswald', color: Colors.black54),
        ),
        Text(
          dashboard.indicator2Title,
          style: TextStyle(
              fontSize: 14.0, fontFamily: 'Oswald', color: Colors.redAccent),
        ),
        Text(
          _f.format(dashboard.indicator2).toString(),
          style: TextStyle(
              fontSize: 20.0, fontFamily: 'Oswald', color: Colors.black54),
        ),
      ],
    );
  }
  Widget _ageWidget(_f) {
    Intl.defaultLocale = 'ru';
    return Column(
      children: <Widget>[
        Text(
          dashboard.indicator1Title,
          style: TextStyle(
              fontSize: 14.0, fontFamily: 'Oswald', color: Colors.blue),
        ),
        Text(
          _f.format(dashboard.indicator1).toString(),
          style: TextStyle(
              fontSize: 20.0, fontFamily: 'Oswald', color: Colors.black54),
        ),
        Text(
          dashboard.indicator2Title,
          style: TextStyle(
              fontSize: 14.0, fontFamily: 'Oswald', color: Colors.redAccent),
        ),
        Text(
          _f.format(dashboard.indicator2).toString(),
          style: TextStyle(
              fontSize: 20.0, fontFamily: 'Oswald', color: Colors.black54),
        ),
      ],
    );
  }

  // ignore: missing_return
  Widget _choiceCardWidget() {
    NumberFormat _f = NumberFormat();
    Widget result;
    var chartType = dashboard.dashboardItemType;
    switch (chartType) {
      case 1:
        result = _headcoundWidget(_f);
        return result;
      case 2:
        result = _salaryWidget(_f);
        return result;
      case 3:
        result = _turnoverWidget(_f);
        return result;
      case 4:
        result = _ageWidget(_f);
        return result;
    }

  }

  // ignore: missing_return
  Color _getColor() {
    Color result;
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
      case 4:
        result = Colors.purple[700];
        return result;
    }
  }

  void _getRoute(BuildContext context) {
    var getRoute;
    var chartType = dashboard.dashboardItemType;
    switch (chartType) {
      case 1:
        getRoute = Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ChartView(dataHeadcount, 'ЧИСЛЕННОСТЬ')),
        );
        return getRoute;
      case 2:
        getRoute = Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ChartView(dataSalary, 'ЗАРПЛАТА')),
        );
        return getRoute;
      case 3:
        getRoute = Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ChartView(dataTurnover, 'ТЕКУЧЕСТЬ КАДРОВ')),
        );
        return getRoute;
      case 4:
        getRoute = Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ChartView(dataAge, 'ВОЗРАСТ СОТРУДНИКОВ')),
        );
        return getRoute;
    }

  }

}
