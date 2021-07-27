// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SearchStatus _$initial = const SearchStatus._('initial');
const SearchStatus _$loading = const SearchStatus._('loading');
const SearchStatus _$success = const SearchStatus._('success');
const SearchStatus _$failure = const SearchStatus._('failure');

SearchStatus _$valueOf(String name) {
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

final BuiltSet<SearchStatus> _$values =
    new BuiltSet<SearchStatus>(const <SearchStatus>[
  _$initial,
  _$loading,
  _$success,
  _$failure,
]);

Serializer<SearchStatus> _$searchStatusSerializer =
    new _$SearchStatusSerializer();

class _$SearchStatusSerializer implements PrimitiveSerializer<SearchStatus> {
  @override
  final Iterable<Type> types = const <Type>[SearchStatus];
  @override
  final String wireName = 'SearchStatus';

  @override
  Object serialize(Serializers serializers, SearchStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  SearchStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SearchStatus.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
