import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:weather/weather.dart';
import 'package:weather_repository/weather_repository.dart';

class OpenWeatherMapsApiClient extends Mock implements WeatherFactory {}

class MockWeather extends Mock implements Weather {}

void main() {
  group('WeatherRepository', () {
    late WeatherFactory openWeatherApiClient;
    late WeatherRepository weatherRepository;

    setUp(() {
      openWeatherApiClient = OpenWeatherMapsApiClient();
      weatherRepository = WeatherRepository(
        apiKey: '',
        weatherApiClient: openWeatherApiClient,
      );
    });

    group('constructor', () {
      test('instantiates internal OpenWeatherApiClient when not injected', () {
        expect(WeatherRepository(apiKey: ''), isNotNull);
      });
    });

    group('currentWeatherByCityName', () {
      const cityName = 'Berlin';

      test('calls currentWeatherByCityName with correct city', () async {
        try {
          await weatherRepository.currentWeatherByCityName(cityName);
        } catch (_) {}
        verify(() => openWeatherApiClient.currentWeatherByCityName(cityName)).called(1);
      });

      test('throws when currentWeatherByCityName fails', () async {
        final exception = Exception('oops');
        when(() => openWeatherApiClient.currentWeatherByCityName(any())).thenThrow(exception);
        expect(
          () async => await weatherRepository.currentWeatherByCityName(cityName),
          throwsA(exception),
        );
      });

      test('returns correct weather on success (showers)', () async {
        final weather = MockWeather();
        when(() => weather.areaName).thenReturn('Berlin');
        when(() => weather.temperature).thenReturn(Temperature(350.21));
        when(() => weather.weatherConditionCode).thenReturn(202);
        when(() => openWeatherApiClient.currentWeatherByCityName(any())).thenAnswer(
          (_) async => weather,
        );
        final actual = await weatherRepository.currentWeatherByCityName(cityName);
        expect(
            actual,
            WeatherData((b) => b
              ..address = 'Berlin'
              ..temperatureKelvin = 350.21
              ..condition = WeatherCondition.stormShowers));
      });
    });
  });
}
