// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Weather> _$weatherSerializer = new _$WeatherSerializer();

class _$WeatherSerializer implements StructuredSerializer<Weather> {
  @override
  final Iterable<Type> types = const [Weather, _$Weather];
  @override
  final String wireName = 'Weather';

  @override
  Iterable<Object?> serialize(Serializers serializers, Weather object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'cityName',
      serializers.serialize(object.cityName,
          specifiedType: const FullType(String)),
      'temperature',
      serializers.serialize(object.temperature,
          specifiedType: const FullType(double)),
      'condition',
      serializers.serialize(object.condition,
          specifiedType: const FullType(WeatherCondition)),
    ];

    return result;
  }

  @override
  Weather deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'cityName':
          result.cityName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'temperature':
          result.temperature = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'condition':
          result.condition = serializers.deserialize(value,
                  specifiedType: const FullType(WeatherCondition))
              as WeatherCondition;
          break;
      }
    }

    return result.build();
  }
}

class _$Weather extends Weather {
  @override
  final String cityName;
  @override
  final double temperature;
  @override
  final WeatherCondition condition;

  factory _$Weather([void Function(WeatherBuilder)? updates]) =>
      (new WeatherBuilder()..update(updates)).build();

  _$Weather._(
      {required this.cityName,
      required this.temperature,
      required this.condition})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(cityName, 'Weather', 'cityName');
    BuiltValueNullFieldError.checkNotNull(
        temperature, 'Weather', 'temperature');
    BuiltValueNullFieldError.checkNotNull(condition, 'Weather', 'condition');
  }

  @override
  Weather rebuild(void Function(WeatherBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherBuilder toBuilder() => new WeatherBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Weather &&
        cityName == other.cityName &&
        temperature == other.temperature &&
        condition == other.condition;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, cityName.hashCode), temperature.hashCode),
        condition.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Weather')
          ..add('cityName', cityName)
          ..add('temperature', temperature)
          ..add('condition', condition))
        .toString();
  }
}

class WeatherBuilder implements Builder<Weather, WeatherBuilder> {
  _$Weather? _$v;

  String? _cityName;
  String? get cityName => _$this._cityName;
  set cityName(String? cityName) => _$this._cityName = cityName;

  double? _temperature;
  double? get temperature => _$this._temperature;
  set temperature(double? temperature) => _$this._temperature = temperature;

  WeatherCondition? _condition;
  WeatherCondition? get condition => _$this._condition;
  set condition(WeatherCondition? condition) => _$this._condition = condition;

  WeatherBuilder();

  WeatherBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cityName = $v.cityName;
      _temperature = $v.temperature;
      _condition = $v.condition;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Weather other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Weather;
  }

  @override
  void update(void Function(WeatherBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Weather build() {
    final _$result = _$v ??
        new _$Weather._(
            cityName: BuiltValueNullFieldError.checkNotNull(
                cityName, 'Weather', 'cityName'),
            temperature: BuiltValueNullFieldError.checkNotNull(
                temperature, 'Weather', 'temperature'),
            condition: BuiltValueNullFieldError.checkNotNull(
                condition, 'Weather', 'condition'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
