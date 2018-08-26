import 'package:charts_flutter/flutter.dart' as charts;
/*
  Выбираем тип графика:
  10 - простой вертикальный BarChart https://google.github.io/charts/flutter/example/bar_charts/simple
  11 - простой горизонтальный BarChart https://google.github.io/charts/flutter/example/bar_charts/horizontal
  12 - группированный BarChart https://google.github.io/charts/flutter/example/bar_charts/grouped
  2 - простой LineChart https://google.github.io/charts/flutter/example/time_series_charts/simple
  30 - donutchart https://google.github.io/charts/flutter/example/pie_charts/donut
  40 - простой группированный BarChart https://google.github.io/charts/flutter/gallery.html
   */

// Объект график со своими параметрами
class ChartEntry{
  int chartType; // тип графика
  List<String> databaseRefName; //ссылка на файл
  String chartTitle; //название графика
  List<charts.Color> color; // цвет графика
  String units; //единицы измерения

  ChartEntry(this.chartType, this.databaseRefName, this.chartTitle, this.color,
      this.units);
}