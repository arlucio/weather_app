import 'package:bloc_test/bloc_test.dart';
import 'package:business/search/models/search_state.dart';
import 'package:business/search/models/search_status.dart';
import 'package:business/search/search_cubit.dart';
import 'package:business/weather/models/temperature_units.dart';
import 'package:business/weather/models/weather.dart';
import 'package:business/weather/models/weather_state.dart';
import 'package:business/weather/models/weather_status.dart';
import 'package:business/weather/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:search_repository/search_repository.dart';
import 'package:weather/weather.dart' hide Weather;
import 'package:weather_app/weather/weather_page.dart';
import 'package:weather_repository/weather_repository.dart';

import 'helpers/hydrated_bloc.dart';

class OpenWeatherMapsApiClient extends Mock implements WeatherFactory {}

class MockWeatherRepository extends Mock implements WeatherRepository {}

class MockSearchRepository extends Mock implements SearchRepository {}

class MockWeatherCubit extends MockCubit<WeatherState> implements WeatherCubit {}

class MockSearchCubit extends MockCubit<SearchState> implements SearchCubit {}

Future<void> main() async {
  initHydratedBloc();
  group('WeatherPage', () {
    late WeatherRepository weatherRepository;
    late SearchRepository searchRepository;

    setUp(() {
      weatherRepository = MockWeatherRepository();
      searchRepository = MockSearchRepository();
      registerFallbackValue(WeatherState.initialState());
      registerFallbackValue(SearchState.initialState());
    });

    testWidgets('renders WeatherView', (tester) async {
      await tester.pumpWidget(MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: weatherRepository,
          ),
          RepositoryProvider<SearchRepository>(
            create: (context) => searchRepository,
          ),
        ],
        child: MaterialApp(home: WeatherPage()),
      ));
      expect(find.byType(WeatherView), findsOneWidget);
    });
  });

  group('WeatherView', () {
    final weather = Weather.fromValues(
      cityName: 'Berlin',
      temperature: 295.15,
      condition: WeatherCondition.cloudy,
    );
    final getWeatherButton = find.byKey(const ValueKey('getWeatherButton'));

    late WeatherCubit weatherCubit;
    late SearchCubit searchCubit;

    setUp(() {
      weatherCubit = MockWeatherCubit();
      searchCubit = MockSearchCubit();
    });

    testWidgets('triggers fetchWeather on "Get Weather" button press', (tester) async {
      when(() => weatherCubit.state).thenReturn(WeatherState.fromValues(
        status: WeatherStatus.success,
        weather: weather,
        temperatureUnits: TemperatureUnits.celsius,
      ));
      when(() => searchCubit.state).thenReturn(SearchState.fromValues(
        status: SearchStatus.initial,
        query: 'Berlin',
        suggestions: placesDefaultList,
      ));
      when(() => weatherCubit.fetchWeather('Berlin')).thenAnswer((_) async {});
      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: weatherCubit,
          ),
          BlocProvider.value(
            value: searchCubit,
          ),
        ],
        child: MaterialApp(home: WeatherView()),
      ));
      await tester.tap(getWeatherButton);
      await tester.pumpAndSettle();
      verify(() => weatherCubit.fetchWeather('Berlin')).called(1);
    });

    testWidgets('triggers fetchWeather on pull to refresh', (tester) async {
      when(() => weatherCubit.state).thenReturn(WeatherState.fromValues(
        status: WeatherStatus.success,
        weather: weather,
        temperatureUnits: TemperatureUnits.celsius,
      ));
      when(() => searchCubit.state).thenReturn(SearchState.fromValues(
        status: SearchStatus.initial,
        query: 'Berlin',
        suggestions: placesDefaultList,
      ));
      when(() => weatherCubit.fetchWeather('Berlin')).thenAnswer((_) async {});
      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: weatherCubit,
          ),
          BlocProvider.value(
            value: searchCubit,
          ),
        ],
        child: MaterialApp(home: WeatherView()),
      ));
      await tester.tap(getWeatherButton);
      await tester.pumpAndSettle();
      verify(() => weatherCubit.fetchWeather('Berlin')).called(1);
      await tester.pump(const Duration(milliseconds: 50));
      final dataWidget = find.byKey(const ValueKey('dataWidget'));
      expect(dataWidget, findsOneWidget);
      await tester.fling(
        dataWidget,
        const Offset(0.0, 500.0),
        1000.0,
      );
      await tester.pumpAndSettle();
      verify(() => weatherCubit.fetchWeather('Berlin')).called(1);
    });

    testWidgets('Test search bar', (tester) async {
      when(() => weatherCubit.state).thenReturn(WeatherState.fromValues(
        status: WeatherStatus.success,
        weather: weather,
        temperatureUnits: TemperatureUnits.celsius,
      ));
      when(() => searchCubit.state).thenReturn(SearchState.fromValues(
        status: SearchStatus.initial,
        query: 'berlin',
        suggestions: placesDefaultList,
      ));
      when(() => searchCubit.onQueryChanged('berlin')).thenAnswer((_) async {});
      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: weatherCubit,
          ),
          BlocProvider.value(
            value: searchCubit,
          ),
        ],
        child: MaterialApp(home: WeatherView()),
      ));
      final searchBarText = find.byKey(const ValueKey('searchBarText'));
      expect(searchBarText, findsOneWidget);
      await tester.tap(searchBarText);
      await tester.pumpAndSettle();
      expect(find.text('Enter a city'), findsOneWidget);
      expect(find.text('Munich'), findsOneWidget);
      final suggestionsList = find.byKey(const ValueKey('searchResults'));
      expect(suggestionsList, findsOneWidget);
    });
  });
}

var placesDefaultList = <Place>[
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
