// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_condition.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const WeatherCondition _$stormShowers =
    const WeatherCondition._('stormShowers');
const WeatherCondition _$thunderstorm =
    const WeatherCondition._('thunderstorm');
const WeatherCondition _$sprinkle = const WeatherCondition._('sprinkle');
const WeatherCondition _$rain = const WeatherCondition._('rain');
const WeatherCondition _$rainMix = const WeatherCondition._('rainMix');
const WeatherCondition _$showers = const WeatherCondition._('showers');
const WeatherCondition _$snow = const WeatherCondition._('snow');
const WeatherCondition _$smoke = const WeatherCondition._('smoke');
const WeatherCondition _$dayHaze = const WeatherCondition._('dayHaze');
const WeatherCondition _$cloudyGusts = const WeatherCondition._('cloudyGusts');
const WeatherCondition _$fog = const WeatherCondition._('fog');
const WeatherCondition _$dust = const WeatherCondition._('dust');
const WeatherCondition _$smog = const WeatherCondition._('smog');
const WeatherCondition _$dayWindy = const WeatherCondition._('dayWindy');
const WeatherCondition _$tornado = const WeatherCondition._('tornado');
const WeatherCondition _$daySunny = const WeatherCondition._('daySunny');
const WeatherCondition _$cloudy = const WeatherCondition._('cloudy');
const WeatherCondition _$hurricane = const WeatherCondition._('hurricane');
const WeatherCondition _$snowFlakeCold =
    const WeatherCondition._('snowFlakeCold');
const WeatherCondition _$hot = const WeatherCondition._('hot');
const WeatherCondition _$windy = const WeatherCondition._('windy');
const WeatherCondition _$hail = const WeatherCondition._('hail');
const WeatherCondition _$unknown = const WeatherCondition._('unknown');

WeatherCondition _$valueOf(String name) {
  switch (name) {
    case 'stormShowers':
      return _$stormShowers;
    case 'thunderstorm':
      return _$thunderstorm;
    case 'sprinkle':
      return _$sprinkle;
    case 'rain':
      return _$rain;
    case 'rainMix':
      return _$rainMix;
    case 'showers':
      return _$showers;
    case 'snow':
      return _$snow;
    case 'smoke':
      return _$smoke;
    case 'dayHaze':
      return _$dayHaze;
    case 'cloudyGusts':
      return _$cloudyGusts;
    case 'fog':
      return _$fog;
    case 'dust':
      return _$dust;
    case 'smog':
      return _$smog;
    case 'dayWindy':
      return _$dayWindy;
    case 'tornado':
      return _$tornado;
    case 'daySunny':
      return _$daySunny;
    case 'cloudy':
      return _$cloudy;
    case 'hurricane':
      return _$hurricane;
    case 'snowFlakeCold':
      return _$snowFlakeCold;
    case 'hot':
      return _$hot;
    case 'windy':
      return _$windy;
    case 'hail':
      return _$hail;
    case 'unknown':
      return _$unknown;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<WeatherCondition> _$values =
    new BuiltSet<WeatherCondition>(const <WeatherCondition>[
  _$stormShowers,
  _$thunderstorm,
  _$sprinkle,
  _$rain,
  _$rainMix,
  _$showers,
  _$snow,
  _$smoke,
  _$dayHaze,
  _$cloudyGusts,
  _$fog,
  _$dust,
  _$smog,
  _$dayWindy,
  _$tornado,
  _$daySunny,
  _$cloudy,
  _$hurricane,
  _$snowFlakeCold,
  _$hot,
  _$windy,
  _$hail,
  _$unknown,
]);

Serializer<WeatherCondition> _$weatherConditionSerializer =
    new _$WeatherConditionSerializer();

class _$WeatherConditionSerializer
    implements PrimitiveSerializer<WeatherCondition> {
  @override
  final Iterable<Type> types = const <Type>[WeatherCondition];
  @override
  final String wireName = 'WeatherCondition';

  @override
  Object serialize(Serializers serializers, WeatherCondition object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  WeatherCondition deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      WeatherCondition.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
