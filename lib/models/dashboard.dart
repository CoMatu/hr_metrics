import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'dashboard.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()

/// Every json_serializable class must have the serializer mixin.
/// It makes the generated toJson() method to be usable for the class.
/// The mixin's name follows the source class, in this case, User.
class Dashboard extends Object with _$DashboardSerializerMixin {

  Dashboard(
      this.dashboardItemType,
      this.indicator1,
      this.indicator2,
      this.mainIndicator,
      this.dashboardItemTitle,
      this.indicator1Title,
      this.indicator2Title,
      this.mainIndicatorUnit);

  int dashboardItemType;
  int indicator1;
  int indicator2;
  var mainIndicator;
  String dashboardItemTitle;
  String indicator1Title;
  String indicator2Title;
  String mainIndicatorUnit;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated _$UserFromJson constructor.
  /// The constructor is named after the source class, in this case User.
  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);
}