import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:weather/weather.dart';
import 'package:weather_repository/src/models/weather_condition.dart';

part 'weather_data.g.dart';

// Map<int,WeatherCondition> conditionMap =

abstract class WeatherData implements Built<WeatherData, WeatherDataBuilder> {
  String get address;
  double get temperatureKelvin;
  WeatherCondition get condition;

  // fromOpenWeatherDataApi
  factory WeatherData.fromOpenWeatherDataApi(Weather weather, WeatherCondition condition) {
    return WeatherData((b) => b
      ..address = weather.areaName
      ..temperatureKelvin = weather.temperature!.kelvin
      ..condition = condition);
  }

  factory WeatherData([Function(WeatherDataBuilder b) updates]) = _$WeatherData;
  static Serializer<WeatherData> get serializer => _$weatherDataSerializer;
  WeatherData._();
}
