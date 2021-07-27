// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_units.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const TemperatureUnits _$celsius = const TemperatureUnits._('celsius');
const TemperatureUnits _$fahrenheit = const TemperatureUnits._('fahrenheit');
const TemperatureUnits _$kelvin = const TemperatureUnits._('kelvin');

TemperatureUnits _$valueOf(String name) {
  switch (name) {
    case 'celsius':
      return _$celsius;
    case 'fahrenheit':
      return _$fahrenheit;
    case 'kelvin':
      return _$kelvin;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<TemperatureUnits> _$values =
    new BuiltSet<TemperatureUnits>(const <TemperatureUnits>[
  _$celsius,
  _$fahrenheit,
  _$kelvin,
]);

Serializer<TemperatureUnits> _$temperatureUnitsSerializer =
    new _$TemperatureUnitsSerializer();

class _$TemperatureUnitsSerializer
    implements PrimitiveSerializer<TemperatureUnits> {
  @override
  final Iterable<Type> types = const <Type>[TemperatureUnits];
  @override
  final String wireName = 'TemperatureUnits';

  @override
  Object serialize(Serializers serializers, TemperatureUnits object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  TemperatureUnits deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      TemperatureUnits.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
