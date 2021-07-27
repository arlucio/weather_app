import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:business/weather/models/temperature_units.dart';
import 'package:business/weather/models/weather.dart';
import 'package:business/weather/models/weather_status.dart';

part 'weather_state.g.dart';

abstract class WeatherState implements Built<WeatherState, WeatherStateBuilder> {
  WeatherStatus get status;
  Weather get weather;
  TemperatureUnits get temperatureUnits;

  factory WeatherState.initialState() => WeatherState((b) => b
    ..status = WeatherStatus.initial
    ..weather = Weather.initialState().toBuilder()
    ..temperatureUnits = TemperatureUnits.celsius);

  /// Used only on tests
  factory WeatherState.fromValues({
    required WeatherStatus status,
    required Weather weather,
    required TemperatureUnits temperatureUnits,
  }) =>
      WeatherState((b) => b
        ..status = status
        ..weather = weather.toBuilder()
        ..temperatureUnits = temperatureUnits);

  bool isInitial() {
    return status == WeatherStatus.initial;
  }

  bool isLoading() {
    return status == WeatherStatus.loading;
  }

  bool isSuccess() {
    return status == WeatherStatus.success;
  }

  bool isFailure() {
    return status == WeatherStatus.failure;
  }

  factory WeatherState([Function(WeatherStateBuilder b) updates]) = _$WeatherState;
  static Serializer<WeatherState> get serializer => _$weatherStateSerializer;
  WeatherState._();
}
