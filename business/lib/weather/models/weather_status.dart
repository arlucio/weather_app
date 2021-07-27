import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'weather_status.g.dart';

class WeatherStatus extends EnumClass {
  static Serializer<WeatherStatus> get serializer => _$weatherStatusSerializer;

  static const WeatherStatus initial = _$initial;
  static const WeatherStatus loading = _$loading;
  static const WeatherStatus success = _$success;
  static const WeatherStatus failure = _$failure;

  const WeatherStatus._(String name) : super(name);

  static BuiltSet<WeatherStatus> get values => _$values;
  static WeatherStatus valueOf(String name) => _$valueOf(name);
}
