import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:hr_metrics/models/bardata.dart';
import 'package:hr_metrics/models/dashboard.dart';
import 'package:hr_metrics/models/linedata.dart';

part 'serializers.g.dart';

@SerializersFor([Dashboard, BarData, LineData])
final Serializers serializers = (
    _$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();