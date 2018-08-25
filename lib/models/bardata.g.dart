// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bardata.dart';

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

Serializer<BarData> _$barDataSerializer = new _$BarDataSerializer();

class _$BarDataSerializer implements StructuredSerializer<BarData> {
  @override
  final Iterable<Type> types = const [BarData, _$BarData];
  @override
  final String wireName = 'BarData';

  @override
  Iterable serialize(Serializers serializers, BarData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'period',
      serializers.serialize(object.period,
          specifiedType: const FullType(String)),
      'count',
      serializers.serialize(object.count,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  BarData deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BarDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'period':
          result.period = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$BarData extends BarData {
  @override
  final String period;
  @override
  final double count;

  factory _$BarData([void updates(BarDataBuilder b)]) =>
      (new BarDataBuilder()..update(updates)).build();

  _$BarData._({this.period, this.count}) : super._() {
    if (period == null) throw new BuiltValueNullFieldError('BarData', 'period');
    if (count == null) throw new BuiltValueNullFieldError('BarData', 'count');
  }

  @override
  BarData rebuild(void updates(BarDataBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  BarDataBuilder toBuilder() => new BarDataBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! BarData) return false;
    return period == other.period && count == other.count;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, period.hashCode), count.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BarData')
          ..add('period', period)
          ..add('count', count))
        .toString();
  }
}

class BarDataBuilder implements Builder<BarData, BarDataBuilder> {
  _$BarData _$v;

  String _period;
  String get period => _$this._period;
  set period(String period) => _$this._period = period;

  double _count;
  double get count => _$this._count;
  set count(double count) => _$this._count = count;

  BarDataBuilder();

  BarDataBuilder get _$this {
    if (_$v != null) {
      _period = _$v.period;
      _count = _$v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BarData other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$BarData;
  }

  @override
  void update(void updates(BarDataBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$BarData build() {
    final _$result = _$v ?? new _$BarData._(period: period, count: count);
    replace(_$result);
    return _$result;
  }
}
