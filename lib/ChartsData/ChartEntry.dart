/*
  Выбираем тип графика:
  10 - простой вертикальный BarChart https://google.github.io/charts/flutter/example/bar_charts/simple
  11 - простой горизонтальный BarChart https://google.github.io/charts/flutter/example/bar_charts/horizontal
  12 - группированный BarChart https://google.github.io/charts/flutter/example/bar_charts/grouped
  2 - простой LineChart https://google.github.io/charts/flutter/example/time_series_charts/simple
  30 - donutchart https://google.github.io/charts/flutter/example/pie_charts/donut
   */

// Объект график со своими параметрами
class ChartEntry{
  int chartType;
  List<String> loadUrl;
  String chartTitle;
  var color;

  ChartEntry(this.chartType, this.loadUrl, this.chartTitle, this.color);
}

