import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'linedata.g.dart';

abstract class LineData implements Built<LineData, LineDataBuilder> {

  DateTime get period;
  int get count;

  static Serializer<LineData> get serializer => _$lineDataSerializer;

  LineData._();
  factory LineData([updates(LineDataBuilder b)]) = _$LineData;
}