import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'bardata.g.dart';

abstract class BarData implements Built<BarData, BarDataBuilder> {

  String get period;
  double get count;

  static Serializer<BarData> get serializer => _$barDataSerializer;
  BarData._();
  factory BarData([updates(BarDataBuilder b)]) = _$BarData;
}
