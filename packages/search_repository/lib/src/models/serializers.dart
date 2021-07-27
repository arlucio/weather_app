import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:search_repository/src/models/place.dart';

part 'serializers.g.dart';

@SerializersFor([
  Place,
])
final Serializers serializers = _$serializers;
final Serializers standardSerializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
