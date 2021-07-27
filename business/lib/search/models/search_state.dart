import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:business/search/models/search_status.dart';
import 'package:search_repository/search_repository.dart' show Place;

part 'search_state.g.dart';

abstract class SearchState implements Built<SearchState, SearchStateBuilder> {
  SearchStatus get status;
  BuiltList<Place> get suggestions;
  String? get query;

  factory SearchState.initialState() => SearchState((b) => b
    ..status = SearchStatus.initial
    ..suggestions = BuiltList<Place>.from(placesDefaultList).toBuilder());

  /// Used only on tests
  factory SearchState.fromValues({
    required SearchStatus status,
    required List<Place> suggestions,
    required String? query,
  }) =>
      SearchState((b) => b
        ..status = status
        ..suggestions = BuiltList<Place>.from(suggestions).toBuilder()
        ..query = query);

  bool isInitial() {
    return status == SearchStatus.initial;
  }

  bool isLoading() {
    return status == SearchStatus.loading;
  }

  bool isSuccess() {
    return status == SearchStatus.success;
  }

  bool isFailure() {
    return status == SearchStatus.failure;
  }

  factory SearchState([Function(SearchStateBuilder b) updates]) = _$SearchState;
  static Serializer<SearchState> get serializer => _$searchStateSerializer;
  SearchState._();
}

var placesDefaultList = [
  Place.fromValues(
    name: 'San Francisco',
    country: 'United States of America',
    state: 'California',
  ),
  Place.fromValues(
    name: 'Singapore',
    country: 'Singapore',
  ),
  Place.fromValues(
    name: 'Munich',
    state: 'Bavaria',
    country: 'Germany',
  ),
  Place.fromValues(
    name: 'London',
    country: 'United Kingdom',
  )
];
