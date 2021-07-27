// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WeatherData> _$weatherDataSerializer = new _$WeatherDataSerializer();

class _$WeatherDataSerializer implements StructuredSerializer<WeatherData> {
  @override
  final Iterable<Type> types = const [WeatherData, _$WeatherData];
  @override
  final String wireName = 'WeatherData';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'temperatureKelvin',
      serializers.serialize(object.temperatureKelvin,
          specifiedType: const FullType(double)),
      'condition',
      serializers.serialize(object.condition,
          specifiedType: const FullType(WeatherCondition)),
    ];

    return result;
  }

  @override
  WeatherData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'temperatureKelvin':
          result.temperatureKelvin = serializers.deserialize(value,
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

class _$WeatherData extends WeatherData {
  @override
  final String address;
  @override
  final double temperatureKelvin;
  @override
  final WeatherCondition condition;

  factory _$WeatherData([void Function(WeatherDataBuilder)? updates]) =>
      (new WeatherDataBuilder()..update(updates)).build();

  _$WeatherData._(
      {required this.address,
      required this.temperatureKelvin,
      required this.condition})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(address, 'WeatherData', 'address');
    BuiltValueNullFieldError.checkNotNull(
        temperatureKelvin, 'WeatherData', 'temperatureKelvin');
    BuiltValueNullFieldError.checkNotNull(
        condition, 'WeatherData', 'condition');
  }

  @override
  WeatherData rebuild(void Function(WeatherDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherDataBuilder toBuilder() => new WeatherDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherData &&
        address == other.address &&
        temperatureKelvin == other.temperatureKelvin &&
        condition == other.condition;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, address.hashCode), temperatureKelvin.hashCode),
        condition.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WeatherData')
          ..add('address', address)
          ..add('temperatureKelvin', temperatureKelvin)
          ..add('condition', condition))
        .toString();
  }
}

class WeatherDataBuilder implements Builder<WeatherData, WeatherDataBuilder> {
  _$WeatherData? _$v;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  double? _temperatureKelvin;
  double? get temperatureKelvin => _$this._temperatureKelvin;
  set temperatureKelvin(double? temperatureKelvin) =>
      _$this._temperatureKelvin = temperatureKelvin;

  WeatherCondition? _condition;
  WeatherCondition? get condition => _$this._condition;
  set condition(WeatherCondition? condition) => _$this._condition = condition;

  WeatherDataBuilder();

  WeatherDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address;
      _temperatureKelvin = $v.temperatureKelvin;
      _condition = $v.condition;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherData;
  }

  @override
  void update(void Function(WeatherDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WeatherData build() {
    final _$result = _$v ??
        new _$WeatherData._(
            address: BuiltValueNullFieldError.checkNotNull(
                address, 'WeatherData', 'address'),
            temperatureKelvin: BuiltValueNullFieldError.checkNotNull(
                temperatureKelvin, 'WeatherData', 'temperatureKelvin'),
            condition: BuiltValueNullFieldError.checkNotNull(
                condition, 'WeatherData', 'condition'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
