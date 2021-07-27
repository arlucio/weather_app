import 'package:built_collection/built_collection.dart';
import 'package:business/search/models/search_state.dart';
import 'package:business/search/models/search_status.dart';
import 'package:business/utils/serializers.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:search_repository/search_repository.dart' show SearchRepository, Place;

class SearchCubit extends HydratedCubit<SearchState> {
  SearchCubit(this._searchRepository) : super(SearchState.initialState());

  final SearchRepository _searchRepository;

  Future<void> onQueryChanged(String query) async {
    if (query == state.query) return;

    emit(state.rebuild((b) => b
      ..query = query
      ..status = SearchStatus.loading));

    if (query.isEmpty) {
      emit(SearchState.initialState());
    } else {
      try {
        final _suggestions = await _searchRepository.getSuggestionsByQuery(query);
        emit(state.rebuild((b) => b
          ..suggestions = BuiltList<Place>.from(_suggestions).toBuilder()
          ..status = SearchStatus.success));
      } on Exception {
        emit(state.rebuild((b) => b..status = SearchStatus.failure));
      }
    }
  }

  Future<void> setQuery(String query) async {
    if (query == state.query) return;

    if (query.isEmpty) {
      emit(SearchState.initialState());
    } else {
      emit(state.rebuild((b) => b..query = query));
    }
  }

  Future<void> clearSuggestions() async {
    var query = state.query;
    emit(state.rebuild((b) => b
      ..query = query
      ..status = SearchStatus.initial
      ..suggestions = BuiltList<Place>.from([
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
        ),
      ]).toBuilder()));
  }

  @override
  SearchState? fromJson(Map<String, dynamic> json) =>
      standardSerializers.deserializeWith(SearchState.serializer, state);

  @override
  Map<String, dynamic> toJson(SearchState state) =>
      standardSerializers.serializeWith(SearchState.serializer, state) as Map<String, dynamic>;
}
