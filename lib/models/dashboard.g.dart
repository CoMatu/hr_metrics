// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

Serializer<Dashboard> _$dashboardSerializer = new _$DashboardSerializer();

class _$DashboardSerializer implements StructuredSerializer<Dashboard> {
  @override
  final Iterable<Type> types = const [Dashboard, _$Dashboard];
  @override
  final String wireName = 'Dashboard';

  @override
  Iterable serialize(Serializers serializers, Dashboard object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'dashboardItemTitle',
      serializers.serialize(object.dashboardItemTitle,
          specifiedType: const FullType(String)),
      'indicator1Title',
      serializers.serialize(object.indicator1Title,
          specifiedType: const FullType(String)),
      'indicator2Title',
      serializers.serialize(object.indicator2Title,
          specifiedType: const FullType(String)),
      'mainIndicatorUnit',
      serializers.serialize(object.mainIndicatorUnit,
          specifiedType: const FullType(String)),
      'dashboardItemType',
      serializers.serialize(object.dashboardItemType,
          specifiedType: const FullType(int)),
      'mainIndicator',
      serializers.serialize(object.mainIndicator,
          specifiedType: const FullType(double)),
      'indicator1',
      serializers.serialize(object.indicator1,
          specifiedType: const FullType(double)),
      'indicator2',
      serializers.serialize(object.indicator2,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  Dashboard deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DashboardBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'dashboardItemTitle':
          result.dashboardItemTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'indicator1Title':
          result.indicator1Title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'indicator2Title':
          result.indicator2Title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mainIndicatorUnit':
          result.mainIndicatorUnit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dashboardItemType':
          result.dashboardItemType = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'mainIndicator':
          result.mainIndicator = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'indicator1':
          result.indicator1 = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'indicator2':
          result.indicator2 = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$Dashboard extends Dashboard {
  @override
  final String dashboardItemTitle;
  @override
  final String indicator1Title;
  @override
  final String indicator2Title;
  @override
  final String mainIndicatorUnit;
  @override
  final int dashboardItemType;
  @override
  final double mainIndicator;
  @override
  final double indicator1;
  @override
  final double indicator2;

  factory _$Dashboard([void updates(DashboardBuilder b)]) =>
      (new DashboardBuilder()..update(updates)).build();

  _$Dashboard._(
      {this.dashboardItemTitle,
      this.indicator1Title,
      this.indicator2Title,
      this.mainIndicatorUnit,
      this.dashboardItemType,
      this.mainIndicator,
      this.indicator1,
      this.indicator2})
      : super._() {
    if (dashboardItemTitle == null)
      throw new BuiltValueNullFieldError('Dashboard', 'dashboardItemTitle');
    if (indicator1Title == null)
      throw new BuiltValueNullFieldError('Dashboard', 'indicator1Title');
    if (indicator2Title == null)
      throw new BuiltValueNullFieldError('Dashboard', 'indicator2Title');
    if (mainIndicatorUnit == null)
      throw new BuiltValueNullFieldError('Dashboard', 'mainIndicatorUnit');
    if (dashboardItemType == null)
      throw new BuiltValueNullFieldError('Dashboard', 'dashboardItemType');
    if (mainIndicator == null)
      throw new BuiltValueNullFieldError('Dashboard', 'mainIndicator');
    if (indicator1 == null)
      throw new BuiltValueNullFieldError('Dashboard', 'indicator1');
    if (indicator2 == null)
      throw new BuiltValueNullFieldError('Dashboard', 'indicator2');
  }

  @override
  Dashboard rebuild(void updates(DashboardBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DashboardBuilder toBuilder() => new DashboardBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Dashboard) return false;
    return dashboardItemTitle == other.dashboardItemTitle &&
        indicator1Title == other.indicator1Title &&
        indicator2Title == other.indicator2Title &&
        mainIndicatorUnit == other.mainIndicatorUnit &&
        dashboardItemType == other.dashboardItemType &&
        mainIndicator == other.mainIndicator &&
        indicator1 == other.indicator1 &&
        indicator2 == other.indicator2;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, dashboardItemTitle.hashCode),
                                indicator1Title.hashCode),
                            indicator2Title.hashCode),
                        mainIndicatorUnit.hashCode),
                    dashboardItemType.hashCode),
                mainIndicator.hashCode),
            indicator1.hashCode),
        indicator2.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Dashboard')
          ..add('dashboardItemTitle', dashboardItemTitle)
          ..add('indicator1Title', indicator1Title)
          ..add('indicator2Title', indicator2Title)
          ..add('mainIndicatorUnit', mainIndicatorUnit)
          ..add('dashboardItemType', dashboardItemType)
          ..add('mainIndicator', mainIndicator)
          ..add('indicator1', indicator1)
          ..add('indicator2', indicator2))
        .toString();
  }
}

class DashboardBuilder implements Builder<Dashboard, DashboardBuilder> {
  _$Dashboard _$v;

  String _dashboardItemTitle;
  String get dashboardItemTitle => _$this._dashboardItemTitle;
  set dashboardItemTitle(String dashboardItemTitle) =>
      _$this._dashboardItemTitle = dashboardItemTitle;

  String _indicator1Title;
  String get indicator1Title => _$this._indicator1Title;
  set indicator1Title(String indicator1Title) =>
      _$this._indicator1Title = indicator1Title;

  String _indicator2Title;
  String get indicator2Title => _$this._indicator2Title;
  set indicator2Title(String indicator2Title) =>
      _$this._indicator2Title = indicator2Title;

  String _mainIndicatorUnit;
  String get mainIndicatorUnit => _$this._mainIndicatorUnit;
  set mainIndicatorUnit(String mainIndicatorUnit) =>
      _$this._mainIndicatorUnit = mainIndicatorUnit;

  int _dashboardItemType;
  int get dashboardItemType => _$this._dashboardItemType;
  set dashboardItemType(int dashboardItemType) =>
      _$this._dashboardItemType = dashboardItemType;

  double _mainIndicator;
  double get mainIndicator => _$this._mainIndicator;
  set mainIndicator(double mainIndicator) =>
      _$this._mainIndicator = mainIndicator;

  double _indicator1;
  double get indicator1 => _$this._indicator1;
  set indicator1(double indicator1) => _$this._indicator1 = indicator1;

  double _indicator2;
  double get indicator2 => _$this._indicator2;
  set indicator2(double indicator2) => _$this._indicator2 = indicator2;

  DashboardBuilder();

  DashboardBuilder get _$this {
    if (_$v != null) {
      _dashboardItemTitle = _$v.dashboardItemTitle;
      _indicator1Title = _$v.indicator1Title;
      _indicator2Title = _$v.indicator2Title;
      _mainIndicatorUnit = _$v.mainIndicatorUnit;
      _dashboardItemType = _$v.dashboardItemType;
      _mainIndicator = _$v.mainIndicator;
      _indicator1 = _$v.indicator1;
      _indicator2 = _$v.indicator2;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Dashboard other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Dashboard;
  }

  @override
  void update(void updates(DashboardBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Dashboard build() {
    final _$result = _$v ??
        new _$Dashboard._(
            dashboardItemTitle: dashboardItemTitle,
            indicator1Title: indicator1Title,
            indicator2Title: indicator2Title,
            mainIndicatorUnit: mainIndicatorUnit,
            dashboardItemType: dashboardItemType,
            mainIndicator: mainIndicator,
            indicator1: indicator1,
            indicator2: indicator2);
    replace(_$result);
    return _$result;
  }
}
