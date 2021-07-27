// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Place> _$placeSerializer = new _$PlaceSerializer();

class _$PlaceSerializer implements StructuredSerializer<Place> {
  @override
  final Iterable<Type> types = const [Place, _$Place];
  @override
  final String wireName = 'Place';

  @override
  Iterable<Object?> serialize(Serializers serializers, Place object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Place deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlaceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Place extends Place {
  @override
  final String name;
  @override
  final String? state;
  @override
  final String? country;

  factory _$Place([void Function(PlaceBuilder)? updates]) =>
      (new PlaceBuilder()..update(updates)).build();

  _$Place._({required this.name, this.state, this.country}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'Place', 'name');
  }

  @override
  Place rebuild(void Function(PlaceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlaceBuilder toBuilder() => new PlaceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Place &&
        name == other.name &&
        state == other.state &&
        country == other.country;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, name.hashCode), state.hashCode), country.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Place')
          ..add('name', name)
          ..add('state', state)
          ..add('country', country))
        .toString();
  }
}

class PlaceBuilder implements Builder<Place, PlaceBuilder> {
  _$Place? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  PlaceBuilder();

  PlaceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _state = $v.state;
      _country = $v.country;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Place other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Place;
  }

  @override
  void update(void Function(PlaceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Place build() {
    final _$result = _$v ??
        new _$Place._(
            name: BuiltValueNullFieldError.checkNotNull(name, 'Place', 'name'),
            state: state,
            country: country);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
