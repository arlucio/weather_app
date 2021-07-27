<p align="center">
  <a href="https://flutter.io/">
    <img src="https://github.com/arlucio/weather_app/raw/master/assets/cwa_logo_blue.png" alt="Logo" width=72 height=72>
  </a>

<h3 align="center">City Weather App</h3>

  <p align="center">
    My implementation of a Weather App using Bloc and Cubit.
</p>

<div align="center">
<table>
<tr>
<td style="text-align:center">
 <img width = "250px" src="https://github.com/arlucio/weather_app/raw/master/assets/start_screen.png" />
 </td>
 <td style="text-align:center">
 <img width = "250px" src="https://github.com/arlucio/weather_app/raw/master/assets/search_screen.png" />
  </td>
 <td style="text-align:center">
 <img width = "250px" src="https://github.com/arlucio/weather_app/raw/master/assets/result_screen.png" />
  </td>
</tr>
</table>
</div>

## Table of contents

- [Quick start](#quick-start)
- [ToDo](#possible-enhancements)

## Quick start

The directory structure tree of the app separates business logic and user interface by using two folders: business, and client. To start the app,
run the main file on the client folder. Also, there is a "packages" folder where the repositories are located.

The app was tested until now only on an Android Pixel 4 phone using the simulator, so the layout may not be completely right for other phones.

This app uses the package [weather](https://pub.dev/packages/weather) to interact with OpenWeatherMaps API. For that it is necessary to create an 
OpenWeatherMaps API Key, and insert it on the start of the main.dart file.

For search location autocomplete [Photon](https://photon.komoot.io/) API is used via http requests.

## Possible Enhancements

- Add Connectivity package to test connection status (Create new ConnectionErrorScreen)
- Caching -> Caching is not working right now, to use HydratedBloc with built_value a Custom Hydrated Storage will be necessary to be created.

