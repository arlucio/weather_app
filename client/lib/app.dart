import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:search_repository/search_repository.dart';
import 'package:weather_app/weather/weather_page.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({
    Key? key,
    required WeatherRepository weatherRepository,
  })  : _weatherRepository = weatherRepository,
        super(key: key);

  final WeatherRepository _weatherRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: _weatherRepository,
        ),
        RepositoryProvider<SearchRepository>(
          create: (context) => SearchRepository(),
        ),
      ],
      child: WeatherAppView(),
    );
  }
}

class WeatherAppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: const Color(0xFFF9AA33),
        backgroundColor: Colors.blueGrey.shade700,
        canvasColor: Colors.blueGrey.shade900,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
            backgroundColor: MaterialStateProperty.all(const Color(0xFFF9AA33)),
          ),
        ),
        textTheme: GoogleFonts.libreFranklinTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFFF9AA33),
          textTheme: GoogleFonts.oranienbaumTextTheme(textTheme).apply(bodyColor: Colors.black),
        ),
      ),
      home: WeatherPage(),
    );
  }
}
