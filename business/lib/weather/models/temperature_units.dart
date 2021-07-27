import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'temperature_units.g.dart';

class TemperatureUnits extends EnumClass {
  static Serializer<TemperatureUnits> get serializer => _$temperatureUnitsSerializer;

  static const TemperatureUnits celsius = _$celsius;
  static const TemperatureUnits fahrenheit = _$fahrenheit;
  static const TemperatureUnits kelvin = _$kelvin;

  const TemperatureUnits._(String name) : super(name);

  bool isFahrenheit() {
    return this == TemperatureUnits.fahrenheit;
  }

  bool isCelsius() {
    return this == TemperatureUnits.celsius;
  }

  bool isKelvin() {
    return this == TemperatureUnits.kelvin;
  }

  static BuiltSet<TemperatureUnits> get values => _$values;
  static TemperatureUnits valueOf(String name) => _$valueOf(name);
}
