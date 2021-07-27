import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:business/search/models/search_state.dart';
import 'package:business/search/models/search_status.dart';
import 'package:business/weather/models/temperature_units.dart';
import 'package:business/weather/models/weather.dart';
import 'package:business/weather/models/weather_state.dart';
import 'package:business/weather/models/weather_status.dart';
import 'package:search_repository/search_repository.dart' show Place;
import 'package:weather_repository/weather_repository.dart' show WeatherCondition;

part 'serializers.g.dart';

@SerializersFor([
  Weather,
  TemperatureUnits,
  WeatherStatus,
  SearchStatus,
  WeatherState,
  WeatherCondition,
  SearchState,
  Place,
])
final Serializers serializers = _$serializers;
final Serializers standardSerializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
