import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_status.g.dart';

class SearchStatus extends EnumClass {
  static Serializer<SearchStatus> get serializer => _$searchStatusSerializer;

  static const SearchStatus initial = _$initial;
  static const SearchStatus loading = _$loading;
  static const SearchStatus success = _$success;
  static const SearchStatus failure = _$failure;

  const SearchStatus._(String name) : super(name);

  static BuiltSet<SearchStatus> get values => _$values;
  static SearchStatus valueOf(String name) => _$valueOf(name);
}
