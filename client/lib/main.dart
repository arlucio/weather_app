import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/app.dart';
import 'package:weather_repository/weather_repository.dart';

const String openWeatherMapsApiKey = 'YOUR_OPEN_WEATHER_MAPS_API_KEY';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  await HydratedBloc.storage.clear();
  runApp(WeatherApp(
      weatherRepository: WeatherRepository(
    apiKey: openWeatherMapsApiKey,
  )));
}
