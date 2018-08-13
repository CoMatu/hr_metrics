// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dashboard _$DashboardFromJson(Map<String, dynamic> json) => new Dashboard(
    json['dashboardItemType'] as int,
    json['indicator1'] as int,
    json['indicator2'] as int,
    json['mainIndicator'],
    json['dashboardItemTitle'] as String,
    json['indicator1Title'] as String,
    json['indicator2Title'] as String,
    json['mainIndicatorUnit'] as String);

abstract class _$DashboardSerializerMixin {
  int get dashboardItemType;
  int get indicator1;
  int get indicator2;
  dynamic get mainIndicator;
  String get dashboardItemTitle;
  String get indicator1Title;
  String get indicator2Title;
  String get mainIndicatorUnit;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'dashboardItemType': dashboardItemType,
        'indicator1': indicator1,
        'indicator2': indicator2,
        'mainIndicator': mainIndicator,
        'dashboardItemTitle': dashboardItemTitle,
        'indicator1Title': indicator1Title,
        'indicator2Title': indicator2Title,
        'mainIndicatorUnit': mainIndicatorUnit
      };
}
