// объект для дашборда с главными показателями
import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'user.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class DashboardEntry extends Object with _$DashboardSerializerMixin {
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

  factory DashboardEntry.fromJson(Map<dynamic, dynamic> json) =>
      _$DashboardFromJson(json);

/*  DashboardEntry.fromJson(Map<dynamic, dynamic> jsonMap)
      : dashboardItemType = jsonMap['dashboardItemType'],
        dashboardItemTitle = jsonMap['dashboardItemTitle'],
        mainIndicator = jsonMap['mainIndicator'],
        mainIndicatorUnit = jsonMap['mainIndicatorUnit'],
        indicator1 = jsonMap['indicator1'],
        indicator2 = jsonMap['indicator2'],
        indicator1Title = jsonMap['indicator1Title'],
        indicator2Title = jsonMap['indicator2Title']
  ;

  Map<dynamic, dynamic> toJson() => {
    'dashboardItemType': dashboardItemType,
    'dashboardItemTitle': dashboardItemTitle,
    'mainIndicator': mainIndicator,
    'mainIndicatorUnit': mainIndicatorUnit,
    'indicator1': indicator1,
    'indicator2': indicator2,
    'indicator1Title': indicator1Title,
    'indicator2Title': indicator2Title
  };*/
}
