// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const WeatherStatus _$initial = const WeatherStatus._('initial');
const WeatherStatus _$loading = const WeatherStatus._('loading');
const WeatherStatus _$success = const WeatherStatus._('success');
const WeatherStatus _$failure = const WeatherStatus._('failure');

WeatherStatus _$valueOf(String name) {
  switch (name) {
    case 'initial':
      return _$initial;
    case 'loading':
      return _$loading;
    case 'success':
      return _$success;
    case 'failure':
      return _$failure;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<WeatherStatus> _$values =
    new BuiltSet<WeatherStatus>(const <WeatherStatus>[
  _$initial,
  _$loading,
  _$success,
  _$failure,
]);

Serializer<WeatherStatus> _$weatherStatusSerializer =
    new _$WeatherStatusSerializer();

class _$WeatherStatusSerializer implements PrimitiveSerializer<WeatherStatus> {
  @override
  final Iterable<Type> types = const <Type>[WeatherStatus];
  @override
  final String wireName = 'WeatherStatus';

  @override
  Object serialize(Serializers serializers, WeatherStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  WeatherStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      WeatherStatus.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
