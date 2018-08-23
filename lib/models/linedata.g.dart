// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linedata.dart';

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

Serializer<LineData> _$lineDataSerializer = _$LineDataSerializer();

class _$LineDataSerializer implements StructuredSerializer<LineData> {
  @override
  final Iterable<Type> types = const [LineData, _$LineData];
  @override
  final String wireName = 'LineData';

  @override
  Iterable serialize(Serializers serializers, LineData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'period',
      serializers.serialize(object.period,
          specifiedType: const FullType(DateTime)),
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  LineData deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = LineDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'period':
          result.period = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$LineData extends LineData {
  @override
  final DateTime period;
  @override
  final int count;

  factory _$LineData([void updates(LineDataBuilder b)]) =>
      (LineDataBuilder()..update(updates)).build();

  _$LineData._({this.period, this.count}) : super._() {
    if (period == null)
      throw BuiltValueNullFieldError('LineData', 'period');
    if (count == null) throw BuiltValueNullFieldError('LineData', 'count');
  }

  @override
  LineData rebuild(void updates(LineDataBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LineDataBuilder toBuilder() => LineDataBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! LineData) return false;
    return period == other.period && count == other.count;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, period.hashCode), count.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LineData')
          ..add('period', period)
          ..add('count', count))
        .toString();
  }
}

class LineDataBuilder implements Builder<LineData, LineDataBuilder> {
  _$LineData _$v;

  DateTime _period;
  DateTime get period => _$this._period;
  set period(DateTime period) => _$this._period = period;

  int _count;
  int get count => _$this._count;
  set count(int count) => _$this._count = count;

  LineDataBuilder();

  LineDataBuilder get _$this {
    if (_$v != null) {
      _period = _$v.period;
      _count = _$v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LineData other) {
    if (other == null) throw ArgumentError.notNull('other');
    _$v = other as _$LineData;
  }

  @override
  void update(void updates(LineDataBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$LineData build() {
    final _$result = _$v ?? _$LineData._(period: period, count: count);
    replace(_$result);
    return _$result;
  }
}
