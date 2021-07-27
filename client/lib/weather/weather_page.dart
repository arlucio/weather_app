import 'package:auto_size_text/auto_size_text.dart';
import 'package:business/search/models/search_state.dart';
import 'package:business/search/search_cubit.dart';
import 'package:business/weather/models/weather_state.dart';
import 'package:business/weather/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:search_repository/search_repository.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_repository/weather_repository.dart';

Color appAmber = const Color(0xFFF9AA33);

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(
          create: (context) => WeatherCubit(context.read<WeatherRepository>()),
        ),
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(context.read<SearchRepository>()),
        ),
      ],
      child: WeatherView(),
    );
  }
}

class WeatherView extends StatefulWidget {
  @override
  _WeatherViewState createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final _searchBarController = FloatingSearchBarController();
  final _refreshController = RefreshController(initialRefresh: false);
  var searchIsOpen = false;

  @override
  Widget build(BuildContext context) {
    var canvasHeight = (MediaQuery.of(context).size.height);
    final searchCubit = BlocProvider.of<SearchCubit>(context, listen: false);
    final weatherCubit = BlocProvider.of<WeatherCubit>(context, listen: false);
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Center(
          child: Text(
            'City Weather App',
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        return SmartRefresher(
          controller: _refreshController,
          onRefresh: () async {
            await weatherCubit.fetchWeather(searchCubit.state.query);
            _refreshController.refreshCompleted();
          },
          enablePullDown: state.isSuccess() ? true : false,
          header: const WaterDropHeader(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                key: const Key('dataWidget'),
                width: 300.0,
                top: isPortrait ? MediaQuery.of(context).size.height / 10 : 50.0,
                child: state.isSuccess()
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 70.0),
                            child: Icon(
                              state.weather.condition.toIcon ?? WeatherIcons.alien,
                              color: appAmber,
                              size: 110.0,
                            ),
                          ),
                          Container(
                            height: 150.0,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 130.0,
                                  child: AutoSizeText(
                                    '${state.weather.temperature.toCelsius().toStringAsPrecision(2)}°C',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: GoogleFonts.oswald(
                                      color: appAmber,
                                      fontSize: 52.0,
                                      height: 1.1,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 70.0,
                                  width: 130.0,
                                  child: AutoSizeText(
                                    state.weather.cityName,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.oswald(
                                      color: appAmber,
                                      fontSize: 52.0,
                                      height: 1.1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : state.isInitial()
                        ? Container(
                            height: 160.0,
                            child: AutoSizeText(
                              'Welcome to City Weather App',
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.oranienbaum(
                                color: appAmber,
                                fontSize: 48.0,
                              ),
                            ),
                          )
                        : state.isLoading()
                            ? Container(
                                height: 120.0,
                                child: Center(
                                  child: SpinKitRing(
                                    color: appAmber,
                                    size: 120.0,
                                  ),
                                ),
                              )
                            : Container(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: searchIsOpen ? 0.0 : (MediaQuery.of(context).size.height / 3),
                ),
                child: Center(child: buildSearchBar()),
              ),
              searchIsOpen
                  ? Container()
                  : Positioned(
                      width: 320.0,
                      height: 50.0,
                      top: canvasHeight / 3 + 80,
                      child: ElevatedButton(
                        key: const Key('getWeatherButton'),
                        onPressed: () async {
                          // unawaited(weatherCubit.fetchWeather(searchCubit.state.query));
                          await weatherCubit.fetchWeather(searchCubit.state.query);
                        },
                        child: Text(
                          'Get Weather',
                          style: GoogleFonts.libreFranklin(fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                        )),
                      ),
                    ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildSearchBar() {
    final actions = [
      FloatingSearchBarAction(
        showIfOpened: false,
        child: CircularButton(
          icon: const Icon(
            Icons.search,
            color: Colors.black,
            size: 34,
          ),
          onPressed: () {},
        ),
      ),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ];

    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) => FloatingSearchBar(
        key: const Key('searchBar'),
        width: 320.0,
        height: 50.0,
        actions: actions,
        backgroundColor: appAmber,
        backdropColor: appAmber,
        title: Text(
          state.query ?? 'Enter a city',
          key: const Key('searchBarText'),
          style: GoogleFonts.libreFranklin(
            fontSize: 20.0,
          ),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        automaticallyImplyBackButton: true,
        controller: _searchBarController,
        clearQueryOnClose: false,
        hint: 'Enter a city',
        iconColor: Colors.black,
        transitionDuration: const Duration(milliseconds: 800),
        transitionCurve: Curves.easeInOutCubic,
        physics: const BouncingScrollPhysics(),
        openAxisAlignment: 0.0,
        progress: state.isLoading(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        debounceDelay: const Duration(milliseconds: 500),
        onQueryChanged: context.read<SearchCubit>().onQueryChanged,
        scrollPadding: EdgeInsets.zero,
        transition: ExpandingFloatingSearchBarTransition(),
        closeOnBackdropTap: true,
        builder: (context, _) => buildExpandableBody(state),
        onFocusChanged: (status) => setState(() => searchIsOpen = status),
      ),
    );
  }

  Widget buildExpandableBody(SearchState state) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Material(
        color: Colors.white,
        elevation: 4.0,
        borderRadius: BorderRadius.circular(8),
        child: ImplicitlyAnimatedList<Place>(
          key: const Key('searchResults'),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          items: state.suggestions.take(5).toList(),
          areItemsTheSame: (a, b) => a == b,
          itemBuilder: (context, animation, place, i) {
            return SizeFadeTransition(
              animation: animation,
              child: buildItem(context, place),
            );
          },
          updateItemBuilder: (context, animation, place) {
            return FadeTransition(
              opacity: animation,
              child: buildItem(context, place),
            );
          },
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, Place place) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final searchCubit = BlocProvider.of<SearchCubit>(context, listen: false);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () async {
            await searchCubit.setQuery('${place.address}');
            FloatingSearchBar.of(context)!.close();
            setState(() => searchIsOpen = false);
            Future.delayed(
              const Duration(milliseconds: 500),
              () => searchCubit.clearSuggestions(),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const SizedBox(
                  width: 36,
                  child: Icon(Icons.place, key: Key('place')),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: textTheme.subtitle1,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        place.level2Address,
                        style: textTheme.bodyText2!.copyWith(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (searchCubit.state.suggestions.isNotEmpty && place != searchCubit.state.suggestions.last)
          const Divider(height: 0),
      ],
    );
  }

  @override
  void dispose() {
    _searchBarController.dispose();
    _refreshController.dispose();
    super.dispose();
  }
}

var conditionIconMap = {
  WeatherCondition.stormShowers: WeatherIcons.storm_showers,
  WeatherCondition.thunderstorm: WeatherIcons.thunderstorm,
  WeatherCondition.sprinkle: WeatherIcons.sprinkle,
  WeatherCondition.rain: WeatherIcons.rain,
  WeatherCondition.rainMix: WeatherIcons.rain_mix,
  WeatherCondition.showers: WeatherIcons.showers,
  WeatherCondition.cloudyGusts: WeatherIcons.cloudy_gusts,
  WeatherCondition.snow: WeatherIcons.snow,
  WeatherCondition.smoke: WeatherIcons.smoke,
  WeatherCondition.dayHaze: WeatherIcons.day_haze,
  WeatherCondition.daySunny: WeatherIcons.day_sunny,
  WeatherCondition.cloudy: WeatherIcons.cloudy,
  WeatherCondition.fog: WeatherIcons.fog,
  WeatherCondition.dust: WeatherIcons.dust,
  WeatherCondition.smog: WeatherIcons.smog,
  WeatherCondition.dayWindy: WeatherIcons.day_windy,
  WeatherCondition.tornado: WeatherIcons.tornado,
  WeatherCondition.hurricane: WeatherIcons.hurricane,
  WeatherCondition.snowFlakeCold: WeatherIcons.snowflake_cold,
  WeatherCondition.hot: WeatherIcons.hot,
  WeatherCondition.windy: WeatherIcons.windy,
  WeatherCondition.hail: WeatherIcons.hail
};

extension on WeatherCondition {
  IconData? get toIcon {
    return conditionIconMap[this];
  }
}

extension on double {
  double toCelsius() => (this - 273.15);
}
