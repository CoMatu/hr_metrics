import 'package:flutter/material.dart';

class ItemForCard{
  /*
  Выбираем тип графика:
  10 - простой вертикальный BarChart https://google.github.io/charts/flutter/example/bar_charts/simple
  11 - простой горизонтальный BarChart https://google.github.io/charts/flutter/example/bar_charts/horizontal
  12 - группированный BarChart https://google.github.io/charts/flutter/example/bar_charts/grouped
  2 - простой LineChart https://google.github.io/charts/flutter/example/time_series_charts/simple
  3 -
   */
  final int chartTipe;

  ItemForCard (this.chartTipe);
}