import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:search_repository/search_repository.dart';
import 'package:search_repository/src/models/models.dart';

class SearchFailure implements Exception {}

class SearchRepository {
  final http.Client _client;

  SearchRepository({http.Client? client}) : _client = client ?? http.Client();

  Future<List<Place>> getSuggestionsByQuery(String query) async {
    final response = await _client.get(Uri.parse('https://photon.komoot.io/api/?q=$query&limit=6&osm_tag=place:city'));
    final body = json.decode(utf8.decode(response.bodyBytes));
    final features = body['features'] as List;
    var _suggestions = features.map((e) => Place.fromJson(e));
    return _suggestions.toList();
  }
}
