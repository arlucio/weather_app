import 'dart:async';

import 'package:weather/weather.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherFailure implements Exception {}

class WeatherRepository {
  final WeatherFactory _weatherApiClient;
  static final Map<int, WeatherCondition> conditionMap = createConditionMap();

  WeatherRepository({
    WeatherFactory? weatherApiClient,
    required String apiKey,
  }) : _weatherApiClient = weatherApiClient ?? WeatherFactory(apiKey);

  static Map<int, WeatherCondition> createConditionMap() {
    var conditionMap = <int, WeatherCondition>{};

    var stormShowerConditions = [200, 201, 202, 210, 230, 231, 232];
    for (var id in stormShowerConditions) {
      conditionMap[id] = WeatherCondition.stormShowers;
    }

    var thunderstormConditions = [211, 212, 221, 960, 961];
    for (var id in thunderstormConditions) {
      conditionMap[id] = WeatherCondition.thunderstorm;
    }

    var sprinkleConditions = [300, 301, 302, 310, 311, 312, 313, 314, 321, 701];
    for (var id in sprinkleConditions) {
      conditionMap[id] = WeatherCondition.sprinkle;
    }

    var rainConditions = [500, 501, 502, 503, 504];
    for (var id in rainConditions) {
      conditionMap[id] = WeatherCondition.rain;
    }

    var rainMixConditions = [511, 615, 616, 620, 621, 622];
    for (var id in rainMixConditions) {
      conditionMap[id] = WeatherCondition.rainMix;
    }

    var showersConditions = [521, 522, 531];
    for (var id in showersConditions) {
      conditionMap[id] = WeatherCondition.showers;
    }

    var snowConditions = [601, 612, 615];
    for (var id in snowConditions) {
      conditionMap[id] = WeatherCondition.snow;
    }

    var smokeCondition = 711;
    conditionMap[smokeCondition] = WeatherCondition.smoke;

    var dayHazeCondition = 721;
    conditionMap[dayHazeCondition] = WeatherCondition.dayHaze;

    var cloudyGustsConditions = [731, 751, 952, 953, 954, 955, 956, 957, 958, 959, 962];
    for (var id in cloudyGustsConditions) {
      conditionMap[id] = WeatherCondition.cloudyGusts;
    }

    var fogCondition = 741;
    conditionMap[fogCondition] = WeatherCondition.dayHaze;

    var dustCondition = 761;
    conditionMap[dustCondition] = WeatherCondition.dayHaze;

    var smogCondition = 762;
    conditionMap[smogCondition] = WeatherCondition.dayHaze;

    var dayWindyCondition = 771;
    conditionMap[dayWindyCondition] = WeatherCondition.dayHaze;

    var tornadoConditions = [781, 900];
    for (var id in tornadoConditions) {
      conditionMap[id] = WeatherCondition.tornado;
    }

    var daySunnyConditions = [800, 951];
    for (var id in daySunnyConditions) {
      conditionMap[id] = WeatherCondition.daySunny;
    }

    var cloudyConditions = [801, 802, 803, 804];
    for (var id in cloudyConditions) {
      conditionMap[id] = WeatherCondition.cloudy;
    }

    var hurricaneConditions = [901, 902];
    for (var id in hurricaneConditions) {
      conditionMap[id] = WeatherCondition.hurricane;
    }

    var snowFlakeColdCondition = 903;
    conditionMap[snowFlakeColdCondition] = WeatherCondition.dayHaze;

    var hotCondition = 904;
    conditionMap[hotCondition] = WeatherCondition.dayHaze;

    var windyCondition = 905;
    conditionMap[windyCondition] = WeatherCondition.dayHaze;

    var hailCondition = 906;
    conditionMap[hailCondition] = WeatherCondition.dayHaze;

    return conditionMap;
  }

  Future<WeatherData> currentWeatherByCityName(String cityName) async {
    final weather = await _weatherApiClient.currentWeatherByCityName(cityName);
    final condition = conditionMap[weather.weatherConditionCode];
    return WeatherData.fromOpenWeatherDataApi(weather, condition!);
  }
}
