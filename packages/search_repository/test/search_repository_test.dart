import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:search_repository/search_repository.dart';

class MockClient extends Mock implements http.Client {}

class MockSearchRepository extends Mock implements SearchRepository {}

void main() {
  group('SearchRepository', () {
    late SearchRepository searchRepository;
    late SearchRepository mockSearchRepository;
    late http.Client httpClient;

    setUp(() {
      mockSearchRepository = MockSearchRepository();
      httpClient = MockClient();
      searchRepository = SearchRepository(client: httpClient);
      registerFallbackValue(Uri());
    });

    group('constructor', () {
      test('instantiates internal OpenSearchApiClient when not injected', () {
        expect(SearchRepository(), isNotNull);
      });
    });

    group('getSuggestionsByQuery', () {
      const query = 'Brasilia';
      test('calls getSuggestionsByQuery with query', () async {
        try {
          await searchRepository.getSuggestionsByQuery(query);
        } catch (_) {}
        verify(() => httpClient.get(Uri.parse('https://photon.komoot.io/api/?q=Brasilia&limit=6&osm_tag=place:city')))
            .called(1);
      });

      test('throws when getSuggestionsByQuery fails', () async {
        final exception = Exception('oops');
        when(() => httpClient.get(any())).thenThrow(exception);
        expect(
          () async => await searchRepository.getSuggestionsByQuery(query),
          throwsA(exception),
        );
      });

      test('returns correct result', () async {
        var realRepository = SearchRepository();
        when(() => httpClient.get(Uri.parse('https://photon.komoot.io/api/?q=Brasilia&limit=6&osm_tag=place:city')))
            .thenAnswer((_) async => http.Response(answerJson.toString(), 200));
        final actual = await realRepository.getSuggestionsByQuery(query);
        expect(actual, placesList);
      });
    });
  });
}

const answerJson = {
  "features": [
    {
      "geometry": {
        "coordinates": [-47.8823172, -15.7934036],
        "type": "Point"
      },
      "type": "Feature",
      "properties": {
        "osm_id": 34567423,
        "osm_type": "N",
        "country": "Brazil",
        "osm_key": "place",
        "city": "Plano Piloto",
        "countrycode": "BR",
        "osm_value": "city",
        "postcode": "70.701-010",
        "name": "Brasília",
        "county": "Região Integrada de Desenvolvimento do Distrito Federal e Entorno",
        "state": "Federal District",
        "type": "district"
      }
    }
  ],
  "type": "FeatureCollection"
};

var placesList = [
  Place.fromValues(
    name: 'Brasília',
    country: 'Brasil',
    state: 'Distrito Federal',
  ),
];
