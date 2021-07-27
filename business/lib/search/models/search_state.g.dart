// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SearchState> _$searchStateSerializer = new _$SearchStateSerializer();

class _$SearchStateSerializer implements StructuredSerializer<SearchState> {
  @override
  final Iterable<Type> types = const [SearchState, _$SearchState];
  @override
  final String wireName = 'SearchState';

  @override
  Iterable<Object?> serialize(Serializers serializers, SearchState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(SearchStatus)),
      'suggestions',
      serializers.serialize(object.suggestions,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Place)])),
    ];
    Object? value;
    value = object.query;
    if (value != null) {
      result
        ..add('query')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SearchState deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(SearchStatus)) as SearchStatus;
          break;
        case 'suggestions':
          result.suggestions.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Place)]))!
              as BuiltList<Object?>);
          break;
        case 'query':
          result.query = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SearchState extends SearchState {
  @override
  final SearchStatus status;
  @override
  final BuiltList<Place> suggestions;
  @override
  final String? query;

  factory _$SearchState([void Function(SearchStateBuilder)? updates]) =>
      (new SearchStateBuilder()..update(updates)).build();

  _$SearchState._({required this.status, required this.suggestions, this.query})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, 'SearchState', 'status');
    BuiltValueNullFieldError.checkNotNull(
        suggestions, 'SearchState', 'suggestions');
  }

  @override
  SearchState rebuild(void Function(SearchStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchStateBuilder toBuilder() => new SearchStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchState &&
        status == other.status &&
        suggestions == other.suggestions &&
        query == other.query;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, status.hashCode), suggestions.hashCode), query.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchState')
          ..add('status', status)
          ..add('suggestions', suggestions)
          ..add('query', query))
        .toString();
  }
}

class SearchStateBuilder implements Builder<SearchState, SearchStateBuilder> {
  _$SearchState? _$v;

  SearchStatus? _status;
  SearchStatus? get status => _$this._status;
  set status(SearchStatus? status) => _$this._status = status;

  ListBuilder<Place>? _suggestions;
  ListBuilder<Place> get suggestions =>
      _$this._suggestions ??= new ListBuilder<Place>();
  set suggestions(ListBuilder<Place>? suggestions) =>
      _$this._suggestions = suggestions;

  String? _query;
  String? get query => _$this._query;
  set query(String? query) => _$this._query = query;

  SearchStateBuilder();

  SearchStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _suggestions = $v.suggestions.toBuilder();
      _query = $v.query;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchState;
  }

  @override
  void update(void Function(SearchStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchState build() {
    _$SearchState _$result;
    try {
      _$result = _$v ??
          new _$SearchState._(
              status: BuiltValueNullFieldError.checkNotNull(
                  status, 'SearchState', 'status'),
              suggestions: suggestions.build(),
              query: query);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'suggestions';
        suggestions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SearchState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
