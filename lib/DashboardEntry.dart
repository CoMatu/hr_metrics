// объект для дашборда с главными показателями

class DashboardEntry {
  final int dashboardItemType;
  final String dashboardItemTitle;
  final mainIndicator;
  final String mainIndicatorUnit;
  final indicator1;
  final indicator2;
  final String indicator1Title;
  final String indicator2Title;

  DashboardEntry(
      this.dashboardItemType,
      this.dashboardItemTitle,
      this.mainIndicator,
      this.mainIndicatorUnit,
      this.indicator1,
      this.indicator2,
      this.indicator1Title,
      this.indicator2Title);

/*  DashboardEntry.fromJson(Map<dynamic, dynamic> json)
      : dashboardItemType = json['dashboardItemType'],
        dashboardItemTitle = json['dashboardItemTitle'],
        mainIndicator = json['mainIndicator'],
        mainIndicatorUnit = json['mainIndicatorUnit'],
        indicator1 = json['indicator1'],
        indicator2 = json['indicator2'],
        indicator1Title = json['indicator1Title'],
        indicator2Title = json['indicator2Title']
  ;*/
}
