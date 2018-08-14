import 'package:firebase_database/firebase_database.dart';

class DashItem {
  DashItem({
      this.dashboardItemType,
      this.indicator1,
      this.indicator2,
      this.mainIndicator,
      this.dashboardItemTitle,
      this.indicator1Title,
      this.indicator2Title,
      this.mainIndicatorUnit});

  int dashboardItemType;
  int indicator1;
  int indicator2;
  var mainIndicator;
  String dashboardItemTitle;
  String indicator1Title;
  String indicator2Title;
  String mainIndicatorUnit;

  factory DashItem.fromJson(Map<String, dynamic> json) {
    return DashItem(
        dashboardItemType: json['dashboardItemType'],
        dashboardItemTitle: json['dashboardItemTitle'],
      indicator1: json['indicator1'],
      indicator2: json['indicator2'],
      mainIndicator: json['mainIndicator'],
      indicator1Title: json['indicator1Title'],
      indicator2Title: json['indicator2Title'],
      mainIndicatorUnit: json['mainIndicatorUnit'],
    );
  }
}