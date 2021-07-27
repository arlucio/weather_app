// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WeatherState> _$weatherStateSerializer =
    new _$WeatherStateSerializer();

class _$WeatherStateSerializer implements StructuredSerializer<WeatherState> {
  @override
  final Iterable<Type> types = const [WeatherState, _$WeatherState];
  @override
  final String wireName = 'WeatherState';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(WeatherStatus)),
      'weather',
      serializers.serialize(object.weather,
          specifiedType: const FullType(Weather)),
      'temperatureUnits',
      serializers.serialize(object.temperatureUnits,
          specifiedType: const FullType(TemperatureUnits)),
    ];

    return result;
  }

  @override
  WeatherState deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(WeatherStatus)) as WeatherStatus;
          break;
        case 'weather':
          result.weather.replace(serializers.deserialize(value,
              specifiedType: const FullType(Weather))! as Weather);
          break;
        case 'temperatureUnits':
          result.temperatureUnits = serializers.deserialize(value,
                  specifiedType: const FullType(TemperatureUnits))
              as TemperatureUnits;
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherState extends WeatherState {
  @override
  final WeatherStatus status;
  @override
  final Weather weather;
  @override
  final TemperatureUnits temperatureUnits;

  factory _$WeatherState([void Function(WeatherStateBuilder)? updates]) =>
      (new WeatherStateBuilder()..update(updates)).build();

  _$WeatherState._(
      {required this.status,
      required this.weather,
      required this.temperatureUnits})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, 'WeatherState', 'status');
    BuiltValueNullFieldError.checkNotNull(weather, 'WeatherState', 'weather');
    BuiltValueNullFieldError.checkNotNull(
        temperatureUnits, 'WeatherState', 'temperatureUnits');
  }

  @override
  WeatherState rebuild(void Function(WeatherStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherStateBuilder toBuilder() => new WeatherStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherState &&
        status == other.status &&
        weather == other.weather &&
        temperatureUnits == other.temperatureUnits;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, status.hashCode), weather.hashCode),
        temperatureUnits.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WeatherState')
          ..add('status', status)
          ..add('weather', weather)
          ..add('temperatureUnits', temperatureUnits))
        .toString();
  }
}

class WeatherStateBuilder
    implements Builder<WeatherState, WeatherStateBuilder> {
  _$WeatherState? _$v;

  WeatherStatus? _status;
  WeatherStatus? get status => _$this._status;
  set status(WeatherStatus? status) => _$this._status = status;

  WeatherBuilder? _weather;
  WeatherBuilder get weather => _$this._weather ??= new WeatherBuilder();
  set weather(WeatherBuilder? weather) => _$this._weather = weather;

  TemperatureUnits? _temperatureUnits;
  TemperatureUnits? get temperatureUnits => _$this._temperatureUnits;
  set temperatureUnits(TemperatureUnits? temperatureUnits) =>
      _$this._temperatureUnits = temperatureUnits;

  WeatherStateBuilder();

  WeatherStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _weather = $v.weather.toBuilder();
      _temperatureUnits = $v.temperatureUnits;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherState;
  }

  @override
  void update(void Function(WeatherStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WeatherState build() {
    _$WeatherState _$result;
    try {
      _$result = _$v ??
          new _$WeatherState._(
              status: BuiltValueNullFieldError.checkNotNull(
                  status, 'WeatherState', 'status'),
              weather: weather.build(),
              temperatureUnits: BuiltValueNullFieldError.checkNotNull(
                  temperatureUnits, 'WeatherState', 'temperatureUnits'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'weather';
        weather.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'WeatherState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
