import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dashboard.g.dart';

abstract class Dashboard implements Built<Dashboard, DashboardBuilder> {

  String get dashboardItemTitle;
  String get indicator1Title;
  String get indicator2Title;
  String get mainIndicatorUnit;
  int get dashboardItemType;
  double get mainIndicator;
  double get indicator1;
  double get indicator2;

  static Serializer<Dashboard> get serializer => _$dashboardSerializer;

  Dashboard._();
  factory Dashboard([updates(DashboardBuilder b)]) = _$Dashboard;
}