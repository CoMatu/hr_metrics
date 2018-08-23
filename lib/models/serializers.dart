import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:hr_metrics/models/dashboard.dart';

part 'serializers.g.dart';

@SerializersFor([Dashboard])
final Serializers serializers = (
    _$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();