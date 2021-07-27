import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'weather_condition.g.dart';

class WeatherCondition extends EnumClass {
  static Serializer<WeatherCondition> get serializer => _$weatherConditionSerializer;

  static const WeatherCondition stormShowers = _$stormShowers;
  static const WeatherCondition thunderstorm = _$thunderstorm;
  static const WeatherCondition sprinkle = _$sprinkle;
  static const WeatherCondition rain = _$rain;
  static const WeatherCondition rainMix = _$rainMix;
  static const WeatherCondition showers = _$showers;
  static const WeatherCondition snow = _$snow;
  static const WeatherCondition smoke = _$smoke;
  static const WeatherCondition dayHaze = _$dayHaze;
  static const WeatherCondition cloudyGusts = _$cloudyGusts;
  static const WeatherCondition fog = _$fog;
  static const WeatherCondition dust = _$dust;
  static const WeatherCondition smog = _$smog;
  static const WeatherCondition dayWindy = _$dayWindy;
  static const WeatherCondition tornado = _$tornado;
  static const WeatherCondition daySunny = _$daySunny;
  static const WeatherCondition cloudy = _$cloudy;
  static const WeatherCondition hurricane = _$hurricane;
  static const WeatherCondition snowFlakeCold = _$snowFlakeCold;
  static const WeatherCondition hot = _$hot;
  static const WeatherCondition windy = _$windy;
  static const WeatherCondition hail = _$hail;
  static const WeatherCondition unknown = _$unknown;

  const WeatherCondition._(String name) : super(name);

  static BuiltSet<WeatherCondition> get values => _$values;
  static WeatherCondition valueOf(String name) => _$valueOf(name);
}
