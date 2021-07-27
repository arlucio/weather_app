import 'package:business/utils/serializers.dart';
import 'package:business/weather/models/weather.dart';
import 'package:business/weather/models/weather_state.dart';
import 'package:business/weather/models/weather_status.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather_repository/weather_repository.dart' show WeatherRepository;

class WeatherCubit extends HydratedCubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(WeatherState.initialState());

  final WeatherRepository _weatherRepository;

  Future<void> fetchWeather(String? cityName) async {
    if (cityName == null || cityName.isEmpty) return;
    emit(state.rebuild((b) => b.status = WeatherStatus.loading));
    try {
      final weather = Weather.fromRepository(
        await _weatherRepository.currentWeatherByCityName(cityName),
      );
      emit(
        state.rebuild((b) => b
          ..status = WeatherStatus.success
          ..weather.temperature = weather.temperature
          ..weather.cityName = cityName.split(',')[0].capitalizeFirstOfEach
          ..weather.condition = weather.condition),
      );
    } on Exception {
      emit(state.rebuild((b) => b..status = WeatherStatus.failure));
    }
  }

  @override
  WeatherState? fromJson(Map<String, dynamic> json) {
    return standardSerializers.deserializeWith(WeatherState.serializer, state);
  }

  @override
  Map<String, dynamic> toJson(WeatherState state) =>
      standardSerializers.serializeWith(WeatherState.serializer, state) as Map<String, dynamic>;
}

extension CapExtension on String {
  String get inCaps => isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';
  String get allInCaps => toUpperCase();
  String get capitalizeFirstOfEach => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.inCaps).join(' ');
}
