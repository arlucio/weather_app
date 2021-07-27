import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:weather_repository/weather_repository.dart';

part 'weather.g.dart';

abstract class Weather implements Built<Weather, WeatherBuilder> {
  String get cityName;
  double get temperature;
  WeatherCondition get condition;

  factory Weather.initialState() => Weather((b) => b
    ..cityName = ''
    ..temperature = -200.0
    ..condition = WeatherCondition.unknown);

  factory Weather.fromValues({
    required String cityName,
    required double temperature,
    required WeatherCondition condition,
  }) =>
      Weather((b) => b
        ..cityName = cityName
        ..temperature = temperature
        ..condition = condition);

  factory Weather.fromRepository(WeatherData weatherData) {
    return Weather((b) => b
      ..cityName = weatherData.address
      ..temperature = weatherData.temperatureKelvin
      ..condition = weatherData.condition);
  }

  factory Weather([Function(WeatherBuilder b) updates]) = _$Weather;
  static Serializer<Weather> get serializer => _$weatherSerializer;
  Weather._();
}
